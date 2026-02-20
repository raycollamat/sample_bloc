import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/expense_item_model.dart';
import '../../domain/entities/expense_item.dart';

class HiveSetup {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    registerAdapters();
  }

  static void registerAdapters() {
    Hive.registerAdapter(ExpenseCategoryAdapter());
    Hive.registerAdapter(ExpenseItemModelAdapter());
  }

  static Future<Box<ExpenseItemModel>> getExpenseItemsBox() async {
    final box = await Hive.openBox<ExpenseItemModel>('expense_items');

    if (box.isEmpty) {
      await _seedMockExpenses(box);
    }

    return box;
  }

  static Future<void> _seedMockExpenses(Box<ExpenseItemModel> box) async {
    await box.addAll([
      ExpenseItemModel.fromEntity(
        ExpenseItem(
          title: 'Grocery Run',
          description: 'Weekly groceries at the supermarket',
          amount: 85.50,
          category: ExpenseCategory.food,
          date: DateTime(2025, 2, 17),
        ),
      ),
      ExpenseItemModel.fromEntity(
        ExpenseItem(
          title: 'Netflix',
          description: 'Monthly streaming subscription',
          amount: 15.99,
          category: ExpenseCategory.entertainment,
          date: DateTime(2025, 2, 18),
        ),
      ),
      ExpenseItemModel.fromEntity(
        ExpenseItem(
          title: 'Bus Pass',
          description: 'Monthly public transport pass',
          amount: 42.00,
          category: ExpenseCategory.transport,
          date: DateTime(2025, 2, 19),
        ),
      ),
    ]);
  }
}
