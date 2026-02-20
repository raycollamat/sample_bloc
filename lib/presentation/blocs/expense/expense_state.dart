part of 'expense_bloc.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseStateInitial extends ExpenseState {}

class ExpenseStateLoading extends ExpenseState {}

class ExpenseStateLoaded extends ExpenseState {
  final List<ExpenseItem> expenses;

  const ExpenseStateLoaded({required this.expenses});

  @override
  List<Object> get props => [expenses];
}
