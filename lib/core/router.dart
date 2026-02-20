import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/usecases/expense/get_expense_list_usecase.dart';
import '../presentation/blocs/expense/expense_bloc.dart';
import '../presentation/screens/expense/expense_screen.dart';
import '../presentation/screens/home_screen.dart';
import 'service_locator.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/expenses',
        builder: (context, state) => BlocProvider(
          create: (_) =>
              ExpenseBloc(getExpenseListUsecase: getIt<GetExpenseListUsecase>())
                ..add(LoadInitialValues()),
          child: const ExpenseScreen(),
        ),
      ),
      GoRoute(
        path: '/expenses',
        builder: (context, state) => BlocProvider(
          create: (_) =>
              ExpenseBloc(getExpenseListUsecase: getIt<GetExpenseListUsecase>())
                ..add(LoadInitialValues()),
          child: const ExpenseScreen(),
        ),
      ),
    ],
  );
}
