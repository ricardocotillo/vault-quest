import 'dart:async';
import 'package:flutter/material.dart';
import 'package:envelope/core/theme/app_theme.dart';
import 'package:decimal/decimal.dart';

class SpendingInput extends StatefulWidget {
  final Function(Decimal amount, String description) onConfirm;

  const SpendingInput({super.key, required this.onConfirm});

  @override
  State<SpendingInput> createState() => _SpendingInputState();
}

class _SpendingInputState extends State<SpendingInput> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool _showCursor = true;
  late Timer _cursorTimer;

  @override
  void initState() {
    super.initState();
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _showCursor = !_showCursor;
      });
    });
  }

  @override
  void dispose() {
    _cursorTimer.cancel();
    _amountController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.midnightVoid,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RECORED EXPENDITURE',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.gildedGold,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildAmountInput(),
            const SizedBox(height: 16),
            _buildDescInput(),
            const SizedBox(height: 32),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('AMOUNT (GOLD)', style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        TextField(
          controller: _amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: AppTheme.lifeEssence,
          ),
          showCursor: _showCursor,
          cursorWidth: 12,
          cursorHeight: 24,
          cursorColor: AppTheme.lifeEssence,
          decoration: const InputDecoration(
            hintText: '0.00',
            hintStyle: TextStyle(color: Colors.white12),
          ),
        ),
      ],
    );
  }

  Widget _buildDescInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PURPOSE OF QUEST', style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        TextField(
          controller: _descController,
          decoration: const InputDecoration(
            hintText: 'Buying supplies...',
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ABANDON'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            final amount = Decimal.tryParse(_amountController.text) ?? Decimal.zero;
            if (amount > Decimal.zero) {
              widget.onConfirm(amount, _descController.text);
              Navigator.pop(context);
            }
          },
          child: const Text('CONFIRM'),
        ),
      ],
    );
  }
}
