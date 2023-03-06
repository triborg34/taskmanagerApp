import 'package:hive/hive.dart';
part 'taskModel.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String projectRelate = "بدون پروژه";

  @HiveField(3)
  bool status = false;

  @HiveField(4)
  String time;

  TaskModel(
      {required this.projectRelate,
      required this.title,
      required this.subtitle,
      required this.time,
      required this.status});
}
