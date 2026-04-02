import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:envelope/blocs/budget_bloc.dart';
import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/ui/screens/kingdom_map_screen.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:decimal/decimal.dart';

class MockKingdomMapBloc extends Mock implements KingdomMapBloc {}
class MockBudgetBloc extends Mock implements BudgetBloc {}

void main() {
  late MockKingdomMapBloc mockMapBloc;
  late MockBudgetBloc mockBudgetBloc;

  setUp(() {
    mockMapBloc = MockKingdomMapBloc();
    mockBudgetBloc = MockBudgetBloc();
    
    registerFallbackValue(Decimal.zero);
    
    when(() => mockMapBloc.state).thenReturn(KingdomMapInitial());
    when(() => mockMapBloc.stream).thenAnswer((_) => Stream.value(KingdomMapInitial()));
    when(() => mockMapBloc.close()).thenAnswer((_) async {});

    when(() => mockBudgetBloc.state).thenReturn(BudgetInitial());
    when(() => mockBudgetBloc.stream).thenAnswer((_) => Stream.value(BudgetInitial()));
    when(() => mockBudgetBloc.close()).thenAnswer((_) async {});
  });

  testWidgets('Sacrifice journey: dragging one node to another shows dialog', (tester) async {
    final locations = [
      QuestLocation(
        id: '1', name: 'Source', theme: LocationTheme.granary,
        currentBalance: Decimal.parse('100'), allocatedBudget: Decimal.parse('500'),
        isUnderSiege: false, x: 0.2, y: 0.2,
      ),
      QuestLocation(
        id: '2', name: 'Target', theme: LocationTheme.tavern,
        currentBalance: Decimal.parse('0'), allocatedBudget: Decimal.parse('500'),
        isUnderSiege: true, x: 0.8, y: 0.8,
      ),
    ];

    when(() => mockMapBloc.state).thenReturn(KingdomMapLoaded(locations));
    when(() => mockMapBloc.stream).thenAnswer((_) => Stream.value(KingdomMapLoaded(locations)));

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<KingdomMapBloc>.value(value: mockMapBloc),
            BlocProvider<BudgetBloc>.value(value: mockBudgetBloc),
          ],
          child: const KingdomMapScreen(),
        ),
      ),
    );

    await tester.pump();

    // Drag Source to Target
    final sourceFinder = find.text('SOURCE');
    final targetFinder = find.text('TARGET');

    final firstLocation = tester.getCenter(sourceFinder);
    final secondLocation = tester.getCenter(targetFinder);

    final gesture = await tester.startGesture(firstLocation);
    await tester.pump();
    await gesture.moveTo(secondLocation);
    await tester.pump();
    await gesture.up();
    await tester.pumpAndSettle();

    expect(find.text('SACRIFICE'), findsNWidgets(2));
    expect(find.text('Sacrifice gold from Source to reinforce Target?'), findsOneWidget);
  });
}
