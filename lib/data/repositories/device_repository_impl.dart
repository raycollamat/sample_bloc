import '../../domain/entities/device_item.dart';
import '../../domain/repositories/device_repositories.dart';
import '../datasources/local/device_datasource.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceDatasource datasource;

  DeviceRepositoryImpl(this.datasource);

  @override
  Future<List<DeviceItem>> getDevices() async {
    final models = await datasource.getDevices();
    return models.map((model) => model.toEntity()).toList();
  }
}
