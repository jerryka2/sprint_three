import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  /// Initialize Hive with the specified directory and database file.
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init('${directory.path}/energize_nepal.db');

    // Optionally, you can register Hive adapters here if needed.
  }

  /// Open a Hive box by its name.
  static Future<Box> openBox(String boxName) async {
    try {
      return await Hive.openBox(boxName);
    } catch (e) {
      throw Exception('Failed to open box: $boxName. Error: $e');
    }
  }

  /// Close a Hive box by its name.
  static Future<void> closeBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        await box.close();
      }
    } catch (e) {
      throw Exception('Failed to close box: $boxName. Error: $e');
    }
  }

  /// Clear all data in a specific Hive box.
  static Future<void> clearBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        await box.clear();
      } else {
        throw Exception('Box $boxName is not open.');
      }
    } catch (e) {
      throw Exception('Failed to clear box: $boxName. Error: $e');
    }
  }

  /// Add or update data in a specific Hive box.
  static Future<void> addData(
      String boxName, dynamic key, dynamic value) async {
    try {
      final box = await openBox(boxName);
      await box.put(key, value);
    } catch (e) {
      throw Exception('Failed to add data to box: $boxName. Error: $e');
    }
  }

  /// Retrieve data from a specific Hive box using a key.
  static dynamic getData(String boxName, dynamic key) {
    try {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        return box.get(key);
      } else {
        throw Exception('Box $boxName is not open.');
      }
    } catch (e) {
      throw Exception('Failed to retrieve data from box: $boxName. Error: $e');
    }
  }

  /// Delete data from a specific Hive box using a key.
  static Future<void> deleteData(String boxName, dynamic key) async {
    try {
      final box = await openBox(boxName);
      await box.delete(key);
    } catch (e) {
      throw Exception('Failed to delete data from box: $boxName. Error: $e');
    }
  }

  /// Check if a key exists in a specific Hive box.
  static bool containsKey(String boxName, dynamic key) {
    try {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        return box.containsKey(key);
      } else {
        throw Exception('Box $boxName is not open.');
      }
    } catch (e) {
      throw Exception('Failed to check key in box: $boxName. Error: $e');
    }
  }
}
