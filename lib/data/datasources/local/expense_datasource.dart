import 'package:hive/hive.dart';

import '../../models/expense_item_model.dart';

abstract class ExpenseDatasource {
  Future<List<ExpenseItemModel>> getExpenses();
  Future<void> addExpense(ExpenseItemModel model);
}

class ExpenseDatasourceImpl implements ExpenseDatasource {
  final Box<ExpenseItemModel> box;

  ExpenseDatasourceImpl(this.box);

  @override
  Future<List<ExpenseItemModel>> getExpenses() async {
    return box.values.toList();
  }

  @override
  Future<void> addExpense(ExpenseItemModel model) async {
    await box.add(model);
  }
}
