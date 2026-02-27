import '../entities/device_item.dart';

abstract class DeviceRepository {
  Future<List<DeviceItem>> getDevices();
}
