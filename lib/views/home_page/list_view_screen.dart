import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/student_data_controller.dart';
import 'package:student_provider/views/details_page/details_page_main.dart';
import 'package:student_provider/views/edit_student/edit_student_main.dart';

class ListViewHomePage extends StatelessWidget {
  const ListViewHomePage({super.key});
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
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = value.studentData[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StudentDetailsPage(index: index),
                        ));
                  },
                  title: Text(
                    data.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(data.age),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(File(data.image)),
                    radius: 30,
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
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
                          icon: const Icon(
                            Icons.edit_outlined,
                          ),
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
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: value.studentData.length,
          );
        }
      },
    );
  }
}
