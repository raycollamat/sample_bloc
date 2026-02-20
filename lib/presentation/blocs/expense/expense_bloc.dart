import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/expense_item.dart';
import '../../../domain/usecases/expense/get_expense_list_usecase.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final GetExpenseListUsecase getExpenseListUsecase;

  ExpenseBloc({required this.getExpenseListUsecase})
    : super(ExpenseStateInitial()) {
    on<LoadInitialValues>(_onLoad);
  }

  Future<void> _onLoad(
    LoadInitialValues event,
    Emitter<ExpenseState> emit,
  ) async {
    emit(ExpenseStateLoading());

    final expenses = await getExpenseListUsecase();

    emit(ExpenseStateLoaded(expenses: expenses));
  }
}
