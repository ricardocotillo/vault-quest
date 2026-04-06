import 'package:decimal/decimal.dart';
import 'package:envelope/blocs/add_vault_bloc.dart';
import 'package:envelope/blocs/kingdom_map_bloc.dart';
import 'package:envelope/models/vault_presets.dart';
import 'package:envelope/services/haptics_service.dart';
import 'package:envelope/ui/components/structure_card.dart';
import 'package:envelope/ui/components/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddVaultScreen extends StatefulWidget {
  const AddVaultScreen({super.key});

  @override
  State<AddVaultScreen> createState() => _AddVaultScreenState();
}

class _AddVaultScreenState extends State<AddVaultScreen> {
  final _nameController = TextEditingController();
  final _budgetController = TextEditingController();
  final _balanceController = TextEditingController();
  final _fundingController = TextEditingController();
  final _alertController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddVaultBloc>().state;
    _nameController.text = state.name;
    _budgetController.text = state.budgetAmount.toString();
    _balanceController.text = state.startingBalance.toString();
    _fundingController.text = state.fundingSource;
    _alertController.text = state.lowBalanceAlert?.toString() ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _budgetController.dispose();
    _balanceController.dispose();
    _fundingController.dispose();
    _alertController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddVaultBloc, AddVaultState>(
      listener: (context, state) {
        if (state.isSuccess) {
          HapticsService.success();
          context.read<KingdomMapBloc>().add(LoadKingdomMap());
          context.pop();
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: VQColors.error,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'FORGE NEW VAULT',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildIdentitySection(),
              const SizedBox(height: 24),
              _buildTreasurySection(),
              const SizedBox(height: 24),
              _buildCycleSection(),
              const SizedBox(height: 24),
              _buildAutomationSection(),
              const SizedBox(height: 24),
              _buildGoalSection(),
              const SizedBox(height: 48),
              _buildSubmitButton(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: VQColors.primary, size: 20),
        const SizedBox(width: 12),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: VQColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildIdentitySection() {
    return BlocBuilder<AddVaultBloc, AddVaultState>(
      builder: (context, state) {
        return StructureCard(
          backgroundColor: VQColors.surfaceContainerLow,
          children: [
            _buildSectionHeader('Identity Sigil', Icons.auto_awesome),
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'ENVELOPE NAME'),
              onChanged: (val) =>
                  context.read<AddVaultBloc>().add(UpdateVaultField(name: val)),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildColorPicker(state),
                const SizedBox(width: 24),
                _buildIconPicker(state),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildColorPicker(AddVaultState state) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('COLOR CUE', style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Color(state.colorValue ?? VQColors.primary.value),
              border: Border.all(color: VQColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconPicker(AddVaultState state) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ICON CUE', style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: VQColors.surfaceContainerHighest,
              border: Border.all(color: VQColors.primary),
            ),
            child: Icon(
              state.iconCodePoint != null
                  ? IconData(state.iconCodePoint!, fontFamily: 'MaterialIcons')
                  : Icons.help_outline,
              color: VQColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreasurySection() {
    return StructureCard(
      backgroundColor: VQColors.surfaceContainerLow,
      children: [
        _buildSectionHeader('Treasury Parameters', Icons.account_balance),
        const SizedBox(height: 24),
        TextField(
          controller: _budgetController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'BUDGET AMOUNT (GP)',
            suffixText: 'GP',
          ),
          onChanged: (val) => context.read<AddVaultBloc>().add(
            UpdateVaultField(budgetAmount: Decimal.tryParse(val)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _balanceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'STARTING BALANCE (GP)',
            suffixText: 'GP',
          ),
          onChanged: (val) => context.read<AddVaultBloc>().add(
            UpdateVaultField(startingBalance: Decimal.tryParse(val)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _fundingController,
          decoration: const InputDecoration(
            labelText: 'FUNDING SOURCE (BANK/INCOME)',
          ),
          onChanged: (val) => context.read<AddVaultBloc>().add(
            UpdateVaultField(fundingSource: val),
          ),
        ),
      ],
    );
  }

  Widget _buildCycleSection() {
    return BlocBuilder<AddVaultBloc, AddVaultState>(
      builder: (context, state) {
        return StructureCard(
          backgroundColor: VQColors.surfaceContainerLow,
          children: [
            _buildSectionHeader('Cycle & Decree', Icons.history),
            const SizedBox(height: 24),
            _buildDropdown<RenewalFrequency>(
              label: 'RENEWAL FREQUENCY',
              value: state.renewalFrequency,
              items: RenewalFrequency.values,
              onChanged: (val) => context.read<AddVaultBloc>().add(
                UpdateVaultField(renewalFrequency: val),
              ),
              labelBuilder: (v) => v.label,
            ),
            const SizedBox(height: 16),
            _buildDropdown<RolloverRule>(
              label: 'ROLLOVER RULE',
              value: state.rolloverRule,
              items: RolloverRule.values,
              onChanged: (val) => context.read<AddVaultBloc>().add(
                UpdateVaultField(rolloverRule: val),
              ),
              labelBuilder: (v) => v.label,
            ),
            const SizedBox(height: 16),
            _buildDropdown<OverspendBehavior>(
              label: 'OVERSPEND BEHAVIOR',
              value: state.overspendBehavior,
              items: OverspendBehavior.values,
              onChanged: (val) => context.read<AddVaultBloc>().add(
                UpdateVaultField(overspendBehavior: val),
              ),
              labelBuilder: (v) => v.label,
            ),
          ],
        );
      },
    );
  }

  Widget _buildAutomationSection() {
    return StructureCard(
      backgroundColor: VQColors.surfaceContainerLow,
      children: [
        _buildSectionHeader('Automation Enchantments', Icons.bolt),
        const SizedBox(height: 24),
        TextField(
          decoration: const InputDecoration(labelText: 'AUTO-FILL DAY (1-31)'),
          keyboardType: TextInputType.number,
          onChanged: (val) => context.read<AddVaultBloc>().add(
            UpdateVaultField(autoFillDay: int.tryParse(val)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _alertController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'LOW BALANCE ALERT (GP)',
            suffixText: 'GP',
          ),
          onChanged: (val) => context.read<AddVaultBloc>().add(
            UpdateVaultField(lowBalanceAlert: Decimal.tryParse(val)),
          ),
        ),
      ],
    );
  }

  Widget _buildGoalSection() {
    return BlocBuilder<AddVaultBloc, AddVaultState>(
      builder: (context, state) {
        return StructureCard(
          backgroundColor: VQColors.surfaceContainerLow,
          children: [
            _buildSectionHeader('Quest Goal (Optional)', Icons.flag),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 30)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 3650)),
                );
                if (picked != null && context.mounted) {
                  context.read<AddVaultBloc>().add(
                    UpdateVaultField(targetDate: picked),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: VQColors.surfaceLowest,
                  border: Border.all(
                    color: VQColors.tertiary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.targetDate != null
                          ? DateFormat('MMMM d, y').format(state.targetDate!)
                          : 'SELECT TARGET DATE',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: state.targetDate != null
                            ? Colors.white
                            : VQColors.tertiary,
                      ),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: VQColors.tertiary,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<AddVaultBloc, AddVaultState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: state.isSaving
                ? null
                : () {
                    HapticsService.tap();
                    context.read<AddVaultBloc>().add(SubmitVault());
                  },
            child: state.isSaving
                ? const CircularProgressIndicator(color: VQColors.surface)
                : Text('FORGE VAULT'.toUpperCase()),
          ),
        );
      },
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) labelBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(color: VQColors.surfaceLowest),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              dropdownColor: VQColors.surfaceContainerHigh,
              items: items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    labelBuilder(item).toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
