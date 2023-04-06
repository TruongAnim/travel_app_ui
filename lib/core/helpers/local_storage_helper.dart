import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _instance = LocalStorageHelper._internal();
  factory LocalStorageHelper() {
    return _instance;
  }

  static late Box<dynamic> _box;
  static initLocalStorage() async {
    _box = await Hive.openBox('travelApp');
  }

  static dynamic getKey(String key) {
    return _box.get(key);
  }

  static setKey(String key, dynamic value) {
    _box.put(key, value);
  }
}
