import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/device_item.dart';
import '../../../domain/usecases/device/get_device_list_usecase.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final GetDeviceListUsecase _getDeviceListUsecase;

  DeviceBloc({required GetDeviceListUsecase getDeviceListUsecase})
    : _getDeviceListUsecase = getDeviceListUsecase,
      super(DeviceInitial()) {
    on<GetDevicesList>(_onGetDevicesList);
  }

  Future<void> _onGetDevicesList(
    GetDevicesList event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DeviceLoading());

    try {
      final devices = await _getDeviceListUsecase();
      emit(DeviceLoaded(devices: devices));
    } catch (e) {
      emit(DeviceError(error: e));
    }
  }
}
