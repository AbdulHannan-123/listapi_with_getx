import 'package:get/get.dart';

import '../models/postmodel.dart';
import '../repositoried/sharedpreference_service.dart';

class TemperaturesController extends GetxController {
  final SharedPreferencesService _prefsService = Get.put(SharedPreferencesService());
  final RxList<Temperatures> temperatureList = <Temperatures>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTemperatures();
  }

  Future<void> fetchTemperatures() async {
    temperatureList.assignAll(await _prefsService.fetchTemperatures());
  }

  Future<void> saveTemperature(Temperatures temperature) async {
    await _prefsService.saveTemperature(temperature);
    temperatureList.add(temperature);
  }

   Future<void> removeTemperature(Temperatures temperature) async {
    final index = temperatureList.indexWhere((t) => t.id == temperature.id);
    if (index != -1) {
      await _prefsService.removeTemperature(index);
      temperatureList.removeAt(index);
    }
  }
}
