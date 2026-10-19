import 'package:hive_flutter/hive_flutter.dart';
import '../models/task_model.dart';

class HiveService {
  static const String _boxName = 'tasksBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>(_boxName);
  }

  static Box<TaskModel> get _box => Hive.box<TaskModel>(_boxName);

  static List<TaskModel> getTasks() {
    return _box.values.toList();
  }

  static Future<void> addTask(TaskModel task) async {
    await _box.put(task.id, task);
  }

  static Future<void> updateTask(TaskModel task) async {
    await task.save();
  }

  static Future<void> deleteTask(String id) async {
    await _box.delete(id);
  }
}
