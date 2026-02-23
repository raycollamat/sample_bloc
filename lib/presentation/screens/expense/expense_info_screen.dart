import 'package:flutter/material.dart';

import '../../../domain/entities/expense_item.dart';

class ExpenseInfoScreen extends StatelessWidget {
  final ExpenseItem expense;

  const ExpenseInfoScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(label: Text(expense.category.name)),
                const Spacer(),
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            Text('Description', style: textTheme.labelLarge),
            const SizedBox(height: 4),
            Text(expense.description, style: textTheme.bodyMedium),
            const SizedBox(height: 24),
            Text('Date', style: textTheme.labelLarge),
            const SizedBox(height: 4),
            Text(
              '${expense.date.year}-'
              '${expense.date.month.toString().padLeft(2, '0')}-'
              '${expense.date.day.toString().padLeft(2, '0')}',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
