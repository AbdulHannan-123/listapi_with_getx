import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/postmodel.dart';

class SharedPreferencesService extends GetxService {
  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveTemperature(Temperatures temperature) async {
    List<String> tempList = _prefs.getStringList('temperatures') ?? [];
    tempList.add(json.encode(temperature.toJson()));
    await _prefs.setStringList('temperatures', tempList);
  }

  Future<List<Temperatures>> fetchTemperatures() async {
    List<String> tempList = _prefs.getStringList('temperatures') ?? [];
    return tempList.map((jsonString) => Temperatures.fromJson(json.decode(jsonString))).toList();
  }

  Future<void> removeTemperature(int index) async {
    List<String> tempList = _prefs.getStringList('temperatures') ?? [];
    if (index >= 0 && index < tempList.length) {
      tempList.removeAt(index);
      await _prefs.setStringList('temperatures', tempList);
    }
  }
}
