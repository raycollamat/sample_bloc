import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/expense/expense_bloc.dart';
import '../../components/custom_card.dart';
import '../../components/custom_loader.dart';

class ExpensesListScreen extends StatelessWidget {
  const ExpensesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseStateLoading) {
            return const CustomLoader();
          }

          if (state is ExpenseStateLoaded) {
            if (state.expenses.isEmpty) {
              return const Center(child: Text('No expenses yet.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.expenses.length,
              itemBuilder: (context, index) {
                return CustomCard(expense: state.expenses[index], index: index);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
