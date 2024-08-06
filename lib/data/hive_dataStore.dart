import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/models/task.dart';

class HiveDatastore {
  static const boxName = 'taskBox';
  final Box<Task> box = Hive.box<Task>(boxName);

  //new task to box
  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  //show task
  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  //update

  Future<void> updateTask({required Task task}) async {
    await task.save();
  }

  //Delete Task
  Future<void> deleteTask({required Task task}) async {
    await task.delete();
  }

  ValueListenable<Box<Task>> listenToTask() => box.listenable();
}
