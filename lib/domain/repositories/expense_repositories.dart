import '../entities/expense_item.dart';

abstract class ExpenseRepository {
  Future<List<ExpenseItem>> getExpenses();
  Future<void> addExpense(ExpenseItem expense);
}
