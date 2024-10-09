import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/student_data_controller.dart';

class StudentDetailsPage extends StatelessWidget {
  final int index;
  const StudentDetailsPage({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    final studentDataController = Provider.of<StudentDataController>(context);
    final student=studentDataController.studentData[index];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
    );
  }
}