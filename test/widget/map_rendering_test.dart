import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/ui/screens/kingdom_map_screen.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:decimal/decimal.dart';

class MockKingdomMapBloc extends Mock implements KingdomMapBloc {}

void main() {
  late MockKingdomMapBloc mockBloc;

  setUp(() {
    mockBloc = MockKingdomMapBloc();
    when(() => mockBloc.state).thenReturn(KingdomMapInitial());
    when(() => mockBloc.stream).thenAnswer((_) => Stream.value(KingdomMapInitial()));
    // Mock the close method to avoid errors during tearDown
    when(() => mockBloc.close()).thenAnswer((_) async {});
  });

  testWidgets('KingdomMapScreen shows loading indicator', (tester) async {
    when(() => mockBloc.state).thenReturn(KingdomMapLoading());
    when(() => mockBloc.stream).thenAnswer((_) => Stream.value(KingdomMapLoading()));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<KingdomMapBloc>.value(
          value: mockBloc,
          child: const KingdomMapScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('KingdomMapScreen shows locations when loaded', (tester) async {
    final locations = [
      QuestLocation(
        id: '1',
        name: 'Granary',
        theme: LocationTheme.granary,
        currentBalance: Decimal.parse('100'),
        allocatedBudget: Decimal.parse('500'),
        isUnderSiege: false,
        x: 0.5,
        y: 0.5,
      ),
    ];

    when(() => mockBloc.state).thenReturn(KingdomMapLoaded(locations));
    when(() => mockBloc.stream).thenAnswer((_) => Stream.value(KingdomMapLoaded(locations)));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<KingdomMapBloc>.value(
          value: mockBloc,
          child: const KingdomMapScreen(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('GRANARY'), findsOneWidget);
  });
}
