import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:envelope/services/quest_repository.dart';
import 'package:envelope/services/player_repository.dart';
import 'package:envelope/models/quest_location.dart';

abstract class BudgetEvent {}

class SpendMoney extends BudgetEvent {
  final QuestLocation location;
  final Decimal amount;
  final String? description;
  SpendMoney(this.location, this.amount, this.description);
}

class FundLocation extends BudgetEvent {
  final QuestLocation location;
  final Decimal amount;
  FundLocation(this.location, this.amount);
}

class Sacrifice extends BudgetEvent {
  final QuestLocation source;
  final QuestLocation target;
  final Decimal amount;
  Sacrifice(this.source, this.target, this.amount);
}

class EndCycle extends BudgetEvent {}

abstract class BudgetState {}

class BudgetInitial extends BudgetState {}

class BudgetLoading extends BudgetState {}

class BudgetSuccess extends BudgetState {}

class HarvestSuccess extends BudgetState {
  final Decimal harvestedAmount;
  HarvestSuccess(this.harvestedAmount);
}

class BudgetError extends BudgetState {
  final String message;
  BudgetError(this.message);
}

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final QuestRepository _repository;
  final PlayerRepository _playerRepository;

  BudgetBloc(this._repository, this._playerRepository) : super(BudgetInitial()) {
    on<SpendMoney>((event, emit) async {
      emit(BudgetLoading());
      try {
        final newBalance = event.location.currentBalance - event.amount;
        await _repository.updateLocationBalance(event.location.id, newBalance);
        await _repository.addTransaction(event.location.id, -event.amount, 'SPEND', event.description);
        emit(BudgetSuccess());
      } catch (e) {
        emit(BudgetError(e.toString()));
      }
    });

    on<FundLocation>((event, emit) async {
      emit(BudgetLoading());
      try {
        final newBalance = event.location.currentBalance + event.amount;
        await _repository.updateLocationBalance(event.location.id, newBalance);
        await _repository.addTransaction(event.location.id, event.amount, 'FUND', 'Funding');
        emit(BudgetSuccess());
      } catch (e) {
        emit(BudgetError(e.toString()));
      }
    });

    on<Sacrifice>((event, emit) async {
      emit(BudgetLoading());
      try {
        // Validation: Source must have enough gold
        if (event.source.currentBalance < event.amount) {
          throw Exception('Not enough gold in ${event.source.name} for sacrifice!');
        }

        // Reallocate
        final sourceBalance = event.source.currentBalance - event.amount;
        final targetBalance = event.target.currentBalance + event.amount;

        await _repository.updateLocationBalance(event.source.id, sourceBalance);
        await _repository.updateLocationBalance(event.target.id, targetBalance);

        await _repository.addTransaction(event.source.id, -event.amount, 'SACRIFICE_OUT', 'Sacrifice to ${event.target.name}');
        await _repository.addTransaction(event.target.id, event.amount, 'SACRIFICE_IN', 'Sacrifice from ${event.source.name}');

        emit(BudgetSuccess());
      } catch (e) {
        emit(BudgetError(e.toString()));
      }
    });

    on<EndCycle>((event, emit) async {
      emit(BudgetLoading());
      try {
        final currentCycle = await _repository.getCurrentPayCycle();
        if (currentCycle == null) {
          throw Exception('No active pay cycle found!');
        }

        // 1. Harvest all gold from locations
        final locations = await _repository.getAllLocations();
        Decimal totalHarvested = Decimal.zero;

        for (var loc in locations) {
          if (loc.currentBalance > Decimal.zero) {
            totalHarvested += loc.currentBalance;
            await _repository.updateLocationBalance(loc.id, Decimal.zero);
            await _repository.addTransaction(loc.id, -loc.currentBalance, 'HARVEST', 'End of cycle harvest');
          }
        }

        // 2. Update player stash
        final player = await _playerRepository.getPlayer();
        if (player != null) {
          final newStashBalance = player.stashBalance + totalHarvested;
          await _playerRepository.updateStashBalance(newStashBalance);
        }

        // 3. Complete cycle
        await _repository.completeCurrentPayCycle(currentCycle.id, totalHarvested);

        // 4. Start new cycle (next 14 days by default)
        final nextStart = DateTime.now();
        final nextEnd = nextStart.add(const Duration(days: 14));
        await _repository.startNewPayCycle(nextStart, nextEnd);

        emit(HarvestSuccess(totalHarvested));
      } catch (e) {
        emit(BudgetError(e.toString()));
      }
    });
  }
}
