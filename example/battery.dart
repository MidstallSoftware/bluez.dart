import 'package:bluez/bluez.dart';

void main() async {
  var client = BlueZClient();
  await client.connect();

  var adapter = client.adapters.first;
  var bpm = adapter.batteryProviderManager;

  var battery = await bpm.registerBattery(source: 'Dummy Battery');
  await bpm.registerBatteryProvider(battery);

  battery.percentage = 10;
}
