import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'expense_item.g.dart';

@HiveType(typeId: 0)
enum ExpenseCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  utility,
  @HiveField(2)
  entertainment,
  @HiveField(3)
  transport,
  @HiveField(4)
  other,
}

class ExpenseItem extends Equatable {
  final String title;
  final String description;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;

  const ExpenseItem({
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
  });

  @override
  List<Object> get props => [title, description, amount, category, date];
}
