import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_provider/models/student_model.dart';

class StudentDataController with ChangeNotifier {
  final Box<StudentModel> _studentBox;
  List<StudentModel> originalStudentData = [];
  List<StudentModel> _filteredStudentData = [];

  StudentDataController() : _studentBox = Hive.box<StudentModel>('studentBox') {
    originalStudentData = _studentBox.values.toList();
    _filteredStudentData = List.from(originalStudentData);
  }

  List<StudentModel> get studentData => _filteredStudentData;

// Add Student Data
  void addStudent({
    required String name,
    required String age,
    required String phoneNumber,
    required String image,
  }) {
    final newStudent = StudentModel(
        name: name, age: age, phoneNumber: phoneNumber, image: image);
    _studentBox.add(newStudent);
    originalStudentData.add(newStudent);
    _filteredStudentData.add(newStudent);
    notifyListeners();
  }

//delete Student

  void delete({required int index}) async {
    try {
      await _studentBox.deleteAt(index);
      originalStudentData.removeAt(index);
      _filteredStudentData.removeAt(index);
    } catch (e) {
      // print('error deleting:$e');
    }
    notifyListeners();
  }

  void editStudentData(
      {required int index,
      required String name,
      required String age,
      required String phoneNumber,
      required String imagepath}) {
    final editstudent = StudentModel(
        name: name, age: age, phoneNumber: phoneNumber, image: imagepath);
    _studentBox.putAt(index, editstudent);
     originalStudentData[index] = editstudent;
    _filteredStudentData[index] = editstudent;
    notifyListeners();
  }

  void searchName(String query) {
    if (query.isEmpty) {
      _filteredStudentData = List.from(originalStudentData);
    } else {
      _filteredStudentData = originalStudentData.where((student) {
        return student.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}