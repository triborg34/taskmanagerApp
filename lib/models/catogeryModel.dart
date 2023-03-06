import 'package:hive/hive.dart';
part 'catogeryModel.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String name;

  CategoryModel({required this.name});
}
