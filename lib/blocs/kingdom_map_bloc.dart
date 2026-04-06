import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/services/quest_repository.dart';

abstract class KingdomMapEvent {}

class LoadKingdomMap extends KingdomMapEvent {}

abstract class KingdomMapState {}

class KingdomMapInitial extends KingdomMapState {}

class KingdomMapLoading extends KingdomMapState {}

class KingdomMapLoaded extends KingdomMapState {
  final List<QuestLocation> locations;
  KingdomMapLoaded(this.locations);
}

class KingdomMapError extends KingdomMapState {
  final String message;
  KingdomMapError(this.message);
}

class KingdomMapBloc extends Bloc<KingdomMapEvent, KingdomMapState> {
  final QuestRepository _repository;

  KingdomMapBloc(this._repository) : super(KingdomMapInitial()) {
    on<LoadKingdomMap>((event, emit) async {
      emit(KingdomMapLoading());
      try {
        final locations = await _repository.getAllLocations();
        emit(KingdomMapLoaded(locations));
      } catch (e) {
        emit(KingdomMapError(e.toString()));
      }
    });
  }
}
