import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.isCompleted});

  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subTitle;
  @HiveField(3)
  bool isCompleted;

  //new Task

  factory Task.create({
    required String? title,
    required String? subTitle,
  }) =>
      Task(
        id: const Uuid().v1(),
        title: title ?? '',
        subTitle: subTitle ?? '',
        isCompleted: false,
      );
}
