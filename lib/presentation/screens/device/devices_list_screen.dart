import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/device/device_bloc.dart';

class DevicesListScreen extends StatelessWidget {
  const DevicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Devices')),
      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          if (state is DeviceLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DeviceLoaded) {
            if (state.devices.isEmpty) {
              return const Center(child: Text('No devices yet.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.devices.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.devices[index].name));
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
