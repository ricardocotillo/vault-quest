import 'package:decimal/decimal.dart';
import 'package:envelope/models/quest_location.dart';
import 'package:envelope/models/vault_presets.dart';
import 'package:envelope/services/quest_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

abstract class AddVaultEvent {}

class SelectPreset extends AddVaultEvent {
  final VaultPreset preset;
  SelectPreset(this.preset);
}

class UpdateVaultField extends AddVaultEvent {
  final String? name;
  final Decimal? budgetAmount;
  final Decimal? startingBalance;
  final String? fundingSource;
  final RenewalFrequency? renewalFrequency;
  final RolloverRule? rolloverRule;
  final OverspendBehavior? overspendBehavior;
  final int? autoFillDay;
  final Decimal? lowBalanceAlert;
  final DateTime? targetDate;
  final int? iconCodePoint;
  final int? colorValue;

  UpdateVaultField({
    this.name,
    this.budgetAmount,
    this.startingBalance,
    this.fundingSource,
    this.renewalFrequency,
    this.rolloverRule,
    this.overspendBehavior,
    this.autoFillDay,
    this.lowBalanceAlert,
    this.targetDate,
    this.iconCodePoint,
    this.colorValue,
  });
}

class SubmitVault extends AddVaultEvent {}

class AddVaultState {
  final VaultPreset? selectedPreset;
  final String name;
  final Decimal budgetAmount;
  final Decimal startingBalance;
  final String fundingSource;
  final RenewalFrequency renewalFrequency;
  final RolloverRule rolloverRule;
  final OverspendBehavior overspendBehavior;
  final int? autoFillDay;
  final Decimal? lowBalanceAlert;
  final DateTime? targetDate;
  final int? iconCodePoint;
  final int? colorValue;
  final bool isSaving;
  final String? error;
  final bool isSuccess;

  AddVaultState({
    this.selectedPreset,
    this.name = '',
    required this.budgetAmount,
    required this.startingBalance,
    this.fundingSource = '',
    this.renewalFrequency = RenewalFrequency.monthly,
    this.rolloverRule = RolloverRule.rollover,
    this.overspendBehavior = OverspendBehavior.hardStop,
    this.autoFillDay,
    this.lowBalanceAlert,
    this.targetDate,
    this.iconCodePoint,
    this.colorValue,
    this.isSaving = false,
    this.error,
    this.isSuccess = false,
  });

  AddVaultState copyWith({
    VaultPreset? selectedPreset,
    String? name,
    Decimal? budgetAmount,
    Decimal? startingBalance,
    String? fundingSource,
    RenewalFrequency? renewalFrequency,
    RolloverRule? rolloverRule,
    OverspendBehavior? overspendBehavior,
    int? autoFillDay,
    Decimal? lowBalanceAlert,
    DateTime? targetDate,
    int? iconCodePoint,
    int? colorValue,
    bool? isSaving,
    String? error,
    bool? isSuccess,
  }) {
    return AddVaultState(
      selectedPreset: selectedPreset ?? this.selectedPreset,
      name: name ?? this.name,
      budgetAmount: budgetAmount ?? this.budgetAmount,
      startingBalance: startingBalance ?? this.startingBalance,
      fundingSource: fundingSource ?? this.fundingSource,
      renewalFrequency: renewalFrequency ?? this.renewalFrequency,
      rolloverRule: rolloverRule ?? this.rolloverRule,
      overspendBehavior: overspendBehavior ?? this.overspendBehavior,
      autoFillDay: autoFillDay ?? this.autoFillDay,
      lowBalanceAlert: lowBalanceAlert ?? this.lowBalanceAlert,
      targetDate: targetDate ?? this.targetDate,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      colorValue: colorValue ?? this.colorValue,
      isSaving: isSaving ?? this.isSaving,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class AddVaultBloc extends Bloc<AddVaultEvent, AddVaultState> {
  final QuestRepository _repository;

  AddVaultBloc(this._repository)
    : super(
        AddVaultState(
          budgetAmount: Decimal.zero,
          startingBalance: Decimal.zero,
        ),
      ) {
    on<SelectPreset>((event, emit) {
      emit(
        state.copyWith(
          selectedPreset: event.preset,
          name: event.preset.name,
          iconCodePoint: event.preset.icon.codePoint,
          colorValue: event.preset.color.toARGB32(),
        ),
      );
    });

    on<UpdateVaultField>((event, emit) {
      emit(
        state.copyWith(
          name: event.name,
          budgetAmount: event.budgetAmount,
          startingBalance: event.startingBalance,
          fundingSource: event.fundingSource,
          renewalFrequency: event.renewalFrequency,
          rolloverRule: event.rolloverRule,
          overspendBehavior: event.overspendBehavior,
          autoFillDay: event.autoFillDay,
          lowBalanceAlert: event.lowBalanceAlert,
          targetDate: event.targetDate,
          iconCodePoint: event.iconCodePoint,
          colorValue: event.colorValue,
        ),
      );
    });

    on<SubmitVault>((event, emit) async {
      if (state.name.isEmpty) {
        emit(state.copyWith(error: 'Vault name is required'));
        return;
      }
      if (state.budgetAmount <= Decimal.zero) {
        emit(state.copyWith(error: 'Budget amount must be greater than zero'));
        return;
      }

      emit(state.copyWith(isSaving: true));

      try {
        final random = Random();
        final newVault = QuestLocation(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: state.name,
          theme: state.selectedPreset?.theme ?? LocationTheme.village,
          currentBalance: state.startingBalance,
          allocatedBudget: state.budgetAmount,
          isUnderSiege: state.startingBalance <= Decimal.zero,
          x: random.nextDouble(), // Normalized coordinate 0.0 - 1.0
          y: random.nextDouble(), // Normalized coordinate 0.0 - 1.0
          iconCodePoint: state.iconCodePoint,
          colorValue: state.colorValue,
          fundingSource: state.fundingSource,
          renewalFrequency: state.renewalFrequency.name,
          rolloverRule: state.rolloverRule.name,
          overspendBehavior: state.overspendBehavior.name,
          autoFillDay: state.autoFillDay,
          lowBalanceAlert: state.lowBalanceAlert,
          targetDate: state.targetDate,
        );

        await _repository.addLocation(newVault);
        emit(state.copyWith(isSaving: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isSaving: false, error: e.toString()));
      }
    });
  }
}
