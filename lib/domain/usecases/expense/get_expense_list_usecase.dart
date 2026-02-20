import '../../entities/expense_item.dart';
import '../../repositories/expense_repositories.dart';

class GetExpenseListUsecase {
  final ExpenseRepository _expenseRepository;
  GetExpenseListUsecase(this._expenseRepository);

  Future<List<ExpenseItem>> call() async {
    return await _expenseRepository.getExpenses();
  }
}
