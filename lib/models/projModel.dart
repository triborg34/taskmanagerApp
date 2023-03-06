import 'package:hive/hive.dart';

part 'projModel.g.dart';

@HiveType(typeId: 3)
class Project extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String desp;

  @HiveField(2)
  List category = [];

  @HiveField(3)
  String startTime;

  @HiveField(4)
  String endTime;

  @HiveField(5)
  int progress;

  @HiveField(6)
  List tasks = [];

  @HiveField(7)
  DateTime datetime;

  Project(
    this.category,
     {
    required this.title,
    required this.datetime,
    required this.desp,
    required this.startTime,
    required this.endTime,
    required this.progress,
  });
}
