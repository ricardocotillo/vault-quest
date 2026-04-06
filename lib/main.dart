import 'package:envelope/ui/screens/treasury_screen.dart';
import 'package:envelope/ui/screens/kingdom_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:envelope/services/database.dart';
import 'package:envelope/services/quest_repository.dart';
import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/services/player_repository.dart';
import 'package:envelope/blocs/player_profile_bloc.dart';
import 'package:envelope/ui/screens/profile_screen.dart';
import 'package:envelope/blocs/budget_bloc.dart';
import 'package:envelope/blocs/add_vault_bloc.dart';
import 'package:envelope/ui/screens/add_vault_screen.dart';

void main() {
  final db = AppDatabase();
  final questRepo = QuestRepository(db);
  final playerRepo = PlayerRepository(db);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: questRepo),
        RepositoryProvider.value(value: playerRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => KingdomMapBloc(questRepo)),
          BlocProvider(create: (context) => BudgetBloc(questRepo, playerRepo)),
          BlocProvider(
            create: (context) =>
                PlayerProfileBloc(playerRepo)..add(LoadPlayerProfile()),
          ),
        ],
        child: const VaultQuestApp(),
      ),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const KingdomMapScreen()),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const PlayerProfileScreen(),
    ),
    GoRoute(
      path: '/treasury',
      builder: (context, state) => const TreasuryScreen(),
    ),
    GoRoute(
      path: '/add-vault',
      builder: (context, state) => const AddVaultScreen(),
    ),
  ],
);

class VaultQuestApp extends StatelessWidget {
  const VaultQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VaultQuest',
      theme: AppTheme.theme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
