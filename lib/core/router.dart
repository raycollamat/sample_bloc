import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/entities/expense_item.dart';
import '../domain/usecases/expense/get_expense_list_usecase.dart';
import '../presentation/blocs/device/device_bloc.dart';
import '../presentation/blocs/expense/expense_bloc.dart';
import '../presentation/screens/device/devices_list_screen.dart';
import '../presentation/screens/expense/expense_info_screen.dart';
import '../presentation/screens/expense/expenses_list_screen.dart';
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
          child: const ExpensesListScreen(),
        ),
        routes: [
          GoRoute(
            path: ':index',
            builder: (context, state) {
              final expense = state.extra as ExpenseItem;
              return ExpenseInfoScreen(expense: expense);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/devices',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<DeviceBloc>()..add(GetDevicesList()),
          child: const DevicesListScreen(),
        ),
      ),
    ],
  );
}
