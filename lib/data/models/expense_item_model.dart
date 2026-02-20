import 'package:hive/hive.dart';

import '../../domain/entities/expense_item.dart';

part 'expense_item_model.g.dart';

@HiveType(typeId: 1)
class ExpenseItemModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final ExpenseCategory category;
  @HiveField(4)
  final DateTime date;

  ExpenseItemModel({
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
  });

  factory ExpenseItemModel.fromEntity(ExpenseItem entity) {
    return ExpenseItemModel(
      title: entity.title,
      description: entity.description,
      amount: entity.amount,
      category: entity.category,
      date: entity.date,
    );
  }

  ExpenseItem toEntity() {
    return ExpenseItem(
      title: title,
      description: description,
      amount: amount,
      category: category,
      date: date,
    );
  }
}
