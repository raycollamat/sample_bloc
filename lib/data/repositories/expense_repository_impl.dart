import '../../domain/entities/expense_item.dart';
import '../../domain/repositories/expense_repositories.dart';
import '../datasources/local/expense_datasource.dart';
import '../models/expense_item_model.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDatasource datasource;

  ExpenseRepositoryImpl(this.datasource);

  @override
  Future<List<ExpenseItem>> getExpenses() async {
    final models = await datasource.getExpenses();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addExpense(ExpenseItem expense) async {
    final model = ExpenseItemModel.fromEntity(expense);
    await datasource.addExpense(model);
  }
}
