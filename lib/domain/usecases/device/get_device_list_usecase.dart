import '../../entities/device_item.dart';
import '../../repositories/device_repositories.dart';

class GetDeviceListUsecase {
  final DeviceRepository _deviceRepository;
  GetDeviceListUsecase(this._deviceRepository);

  Future<List<DeviceItem>> call() async {
    return await _deviceRepository.getDevices();
  }
}
