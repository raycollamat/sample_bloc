import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../data/datasources/local/device_datasource.dart';
import '../data/datasources/local/expense_datasource.dart';
import '../data/models/expense_item_model.dart';
import '../data/repositories/device_repository_impl.dart';
import '../data/repositories/expense_repository_impl.dart';
import '../domain/repositories/device_repositories.dart';
import '../domain/repositories/expense_repositories.dart';
import '../domain/usecases/device/get_device_list_usecase.dart';
import '../domain/usecases/expense/add_expense_usecase.dart';
import '../domain/usecases/expense/get_expense_list_usecase.dart';
import '../presentation/blocs/device/device_bloc.dart';
import '../presentation/blocs/expense/expense_bloc.dart';
import 'network/dio_client.dart';
import 'services/hive_setup.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  await HiveSetup.initHive();
  final expenseItemsBox = await HiveSetup.getExpenseItemsBox();

  _registerExpenseDependencies(expenseItemsBox);
  _registerDeviceDependencies();
}

void _registerExpenseDependencies(Box<ExpenseItemModel> expenseItemsBox) {
  // Datasource
  getIt.registerLazySingleton<ExpenseDatasource>(
    () => ExpenseDatasourceImpl(expenseItemsBox),
  );

  // Repository
  getIt.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(getIt<ExpenseDatasource>()),
  );

  // Usecases
  getIt.registerLazySingleton(
    () => GetExpenseListUsecase(getIt<ExpenseRepository>()),
  );
  getIt.registerLazySingleton(
    () => AddExpenseUsecase(getIt<ExpenseRepository>()),
  );

  // Blocs
  getIt.registerFactory<ExpenseBloc>(
    () => ExpenseBloc(getExpenseListUsecase: getIt<GetExpenseListUsecase>()),
  );
}

void _registerDeviceDependencies() {
  // Datasource
  getIt.registerLazySingleton<DeviceDatasource>(
    () => DeviceDatasourceImpl(dioClient: getIt<DioClient>()),
  );

  // Repository
  getIt.registerLazySingleton<DeviceRepository>(
    () => DeviceRepositoryImpl(getIt<DeviceDatasource>()),
  );

  // Usecases
  getIt.registerLazySingleton(
    () => GetDeviceListUsecase(getIt<DeviceRepository>()),
  );

  // Blocs
  getIt.registerFactory<DeviceBloc>(
    () => DeviceBloc(getDeviceListUsecase: getIt<GetDeviceListUsecase>()),
  );
}
