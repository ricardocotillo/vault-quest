import 'package:flutter_test/flutter_test.dart';
import 'package:envelope/services/database.dart' hide Player, QuestLocation;
import 'package:envelope/services/quest_repository.dart';
import 'package:envelope/services/player_repository.dart';
import 'package:envelope/blocs/budget_bloc.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/models/player.dart';
import 'package:decimal/decimal.dart';
import 'package:drift/native.dart';
import 'dart:async';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppDatabase db;
  late QuestRepository questRepo;
  late PlayerRepository playerRepo;
  late BudgetBloc budgetBloc;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    questRepo = QuestRepository(db);
    playerRepo = PlayerRepository(db);
    budgetBloc = BudgetBloc(questRepo, playerRepo);
  });

  tearDown(() async {
    await db.close();
  });

  test('End-to-end harvest journey', () async {
    // 1. Setup initial state
    final player = Player(
      id: 'test_player',
      name: 'Test Alchemist',
      xp: 0,
      level: 1,
      stashBalance: Decimal.zero,
      unlockedLoot: [],
      lastLogin: DateTime.now(),
    );
    await playerRepo.createPlayer(player);

    final location = QuestLocation(
      id: 'test_loc',
      name: 'Gold Mine',
      theme: LocationTheme.campsite,
      currentBalance: Decimal.parse('500'),
      allocatedBudget: Decimal.parse('1000'),
      isUnderSiege: false,
      x: 0,
      y: 0,
    );
    await questRepo.addLocation(location);

    await questRepo.startNewPayCycle(DateTime.now(), DateTime.now().add(const Duration(days: 14)));

    // 2. Trigger End Cycle
    budgetBloc.add(EndCycle());

    // 3. Wait for Success state
    await expectLater(
      budgetBloc.stream,
      emitsInOrder([
        isA<BudgetLoading>(),
        isA<HarvestSuccess>(),
      ]),
    );

    // 4. Verify results
    final updatedPlayer = await playerRepo.getPlayer();
    expect(updatedPlayer?.stashBalance, Decimal.parse('500'));

    final updatedLocations = await questRepo.getAllLocations();
    expect(updatedLocations.first.currentBalance, Decimal.zero);

    final completedCycles = await questRepo.getCompletedPayCycles();
    expect(completedCycles.length, 1);
    expect(completedCycles.first.totalHarvested, Decimal.parse('500'));

    final currentCycle = await questRepo.getCurrentPayCycle();
    expect(currentCycle, isNotNull);
    expect(currentCycle?.isCompleted, false);
  });
}
