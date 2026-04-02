import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:envelope/models/player.dart';
import 'package:envelope/services/player_repository.dart';
import 'package:envelope/core/logic/evolution_logic.dart';
import 'package:decimal/decimal.dart';

abstract class PlayerProfileEvent {}

class LoadPlayerProfile extends PlayerProfileEvent {}

class GainXp extends PlayerProfileEvent {
  final int amount;
  GainXp(this.amount);
}

abstract class PlayerProfileState {}

class PlayerProfileInitial extends PlayerProfileState {}

class PlayerProfileLoading extends PlayerProfileState {}

class PlayerProfileLoaded extends PlayerProfileState {
  final Player player;
  PlayerProfileLoaded(this.player);
}

class PlayerProfileError extends PlayerProfileState {
  final String message;
  PlayerProfileError(this.message);
}

class PlayerProfileBloc extends Bloc<PlayerProfileEvent, PlayerProfileState> {
  final PlayerRepository _repository;

  PlayerProfileBloc(this._repository) : super(PlayerProfileInitial()) {
    on<LoadPlayerProfile>((event, emit) async {
      emit(PlayerProfileLoading());
      try {
        var player = await _repository.getPlayer();
        if (player == null) {
          // Create default player if none exists
          player = Player(
            id: 'default',
            name: 'Initiate Alchemist',
            xp: 0,
            level: 1,
            stashBalance: Decimal.parse('1000'),
            unlockedLoot: [],
            lastLogin: DateTime.now(),
          );
          await _repository.createPlayer(player);
        }
        emit(PlayerProfileLoaded(player));
      } catch (e) {
        emit(PlayerProfileError(e.toString()));
      }
    });

    on<GainXp>((event, emit) async {
      if (state is PlayerProfileLoaded) {
        final currentPlayer = (state as PlayerProfileLoaded).player;
        final newXp = currentPlayer.xp + event.amount;
        final newLevel = EvolutionLogic.calculateLevel(newXp);
        
        await _repository.updateXpAndLevel(newXp, newLevel);
        
        final updatedPlayer = Player(
          id: currentPlayer.id,
          name: currentPlayer.name,
          xp: newXp,
          level: newLevel,
          stashBalance: currentPlayer.stashBalance,
          unlockedLoot: currentPlayer.unlockedLoot,
          lastLogin: currentPlayer.lastLogin,
        );
        emit(PlayerProfileLoaded(updatedPlayer));
      }
    });
  }
}
