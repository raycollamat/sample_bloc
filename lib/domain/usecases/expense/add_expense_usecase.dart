import '../../entities/expense_item.dart';
import '../../repositories/expense_repositories.dart';

class AddExpenseUsecase {
  final ExpenseRepository _expenseRepository;
  AddExpenseUsecase(this._expenseRepository);

  Future<void> call(ExpenseItem expense) async {
    await _expenseRepository.addExpense(expense);
  }
}
