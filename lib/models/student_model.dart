import 'package:hive/hive.dart';
part 'student_model.g.dart';
@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String phoneNumber;
  @HiveField(3)
  
  String image;

  StudentModel(
      {required this.name,
      required this.age,
      required this.phoneNumber,
      required this.image});
}
