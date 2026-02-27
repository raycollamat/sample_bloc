part of 'device_bloc.dart';

sealed class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

final class DeviceInitial extends DeviceState {}

final class DeviceLoading extends DeviceState {}

final class DeviceLoaded extends DeviceState {
  final List<DeviceItem> devices;

  const DeviceLoaded({required this.devices});

  @override
  List<Object> get props => [devices];
}

final class DeviceError extends DeviceState {
  final Object error;

  const DeviceError({required this.error});

  @override
  List<Object> get props => [error];
}
