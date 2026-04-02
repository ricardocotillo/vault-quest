import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:envelope/blocs/budget_bloc.dart';
import 'package:envelope/services/quest_repository.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/services/player_repository.dart';
import 'package:decimal/decimal.dart';

class MockQuestRepository extends Mock implements QuestRepository {}
class MockPlayerRepository extends Mock implements PlayerRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(Decimal.zero);
  });

  late BudgetBloc bloc;
  late MockQuestRepository mockRepo;
  late MockPlayerRepository mockPlayerRepo;

  setUp(() {
    mockRepo = MockQuestRepository();
    mockPlayerRepo = MockPlayerRepository();
    bloc = BudgetBloc(mockRepo, mockPlayerRepo);
  });

  test('SpendMoney event updates balance and adds transaction', () async {
    final location = QuestLocation(
      id: '1',
      name: 'Test',
      theme: LocationTheme.granary,
      currentBalance: Decimal.parse('100'),
      allocatedBudget: Decimal.parse('500'),
      isUnderSiege: false,
      x: 0,
      y: 0,
    );

    when(() => mockRepo.updateLocationBalance(any(), any())).thenAnswer((_) async {});
    when(() => mockRepo.addTransaction(any(), any(), any(), any())).thenAnswer((_) async {});

    bloc.add(SpendMoney(location, Decimal.parse('50'), 'Lunch'));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        isA<BudgetLoading>(),
        isA<BudgetSuccess>(),
      ]),
    );

    verify(() => mockRepo.updateLocationBalance('1', Decimal.parse('50'))).called(1);
    verify(() => mockRepo.addTransaction('1', Decimal.parse('-50'), 'SPEND', 'Lunch')).called(1);
  });
}
