import 'package:dio/dio.dart';

import '../../../core/network/dio_client.dart';
import '../../models/device_item_model.dart';

abstract class DeviceDatasource {
  Future<List<DeviceItemModel>> getDevices();
}

class DeviceDatasourceImpl implements DeviceDatasource {
  final DioClient _dioClient;

  DeviceDatasourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<DeviceItemModel>> getDevices() async {
    try {
      final response = await _dioClient.dio.get('objects');

      return (response.data as List)
          .map((e) => DeviceItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _dioClient.handleError(e);
    }
  }
}
