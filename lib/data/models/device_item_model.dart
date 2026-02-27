import '../../domain/entities/device_item.dart';

class DeviceItemModel extends DeviceItem {
  const DeviceItemModel({required super.id, required super.name, super.data});

  factory DeviceItemModel.fromJson(Map<String, dynamic> json) {
    return DeviceItemModel(
      id: json['id'],
      name: json['name'],
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
    );
  }

  DeviceItem toEntity() {
    return DeviceItem(id: id, name: name, data: data);
  }
}

// ------- Data Model -------

class DataModel extends Data {
  const DataModel({required super.fields});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(fields: json);
  }
}
