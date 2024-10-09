import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/student_data_controller.dart';
import 'package:student_provider/views/edit_student/edit_student_main.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentDataController>(
      builder: (context, value, child) {
        if (value.originalStudentData.isEmpty) {
          return const Center(
            child: Text('Add Student'),
          );
        } else if (value.studentData.isEmpty) {
          return const Center(
            child: Text('no search found'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.9),
              itemBuilder: (ctx, index) {
                final data = value.studentData[index];
                if (value.studentData.isEmpty) {
                  return const Center(
                    child: Text(
                      'List is empty',
                      style: TextStyle(color: Colors.amber),
                    ),
                  );
                }
                return Card(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                File(data.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            data.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(data.age),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditStudent(index: index),
                                      ));
                                },
                                icon: const Icon(Icons.edit_outlined),
                                iconSize: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Delete'),
                                        content: const Text(
                                            'Are you sure wanted to Delete'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              value.delete(index: index);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Yes'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('NO'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete_outline),
                                color: Colors.red,
                                iconSize: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                );
              },
              itemCount: value.studentData.length,
            ),
          );
        }
      },
    );
  }
}
