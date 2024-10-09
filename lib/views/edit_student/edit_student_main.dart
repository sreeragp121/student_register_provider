import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/add_image_controller.dart';
import 'package:student_provider/controllers/student_data_controller.dart';
import 'package:student_provider/widgets/add_images/add_images_main.dart';
import 'package:student_provider/widgets/my_text_form_field.dart';

class EditStudent extends StatelessWidget {
  final int index;
  const EditStudent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final studentDataController = Provider.of<StudentDataController>(context);
    final studentData = studentDataController.studentData[index];
    TextEditingController namecontroller =
        TextEditingController(text: studentData.name);
    TextEditingController agecontroller =
        TextEditingController(text: studentData.age);
    TextEditingController phoneNocontroller =
        TextEditingController(text: studentData.phoneNumber);
    final addImagecontroller =
        Provider.of<AddImageController>(context, listen: false);
    addImagecontroller.image = studentData.image;

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        foregroundColor: Colors.black45,
        title: const Text('Add Student Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const AddImagesMain(),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controllers: namecontroller,
                    labelText: '*Name',
                    hintText: 'Student Name',
                    keyboardType: TextInputType.text,
                  ),
                  MyTextFormField(
                    controllers: agecontroller,
                    labelText: '*Age',
                    hintText: 'Student Age',
                    inputLength: 2,
                    keyboardType: TextInputType.number,
                  ),
                  MyTextFormField(
                    controllers: phoneNocontroller,
                    labelText: '*Phone Number',
                    hintText: 'Phone Number',
                    inputLength: 10,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          studentDataController.editStudentData(
                              index: index,
                              name: namecontroller.text,
                              age: agecontroller.text,
                              phoneNumber: phoneNocontroller.text,
                              imagepath: addImagecontroller.image.toString());
                             Navigator.pop(context); 
                        }
                      },
                      child: const Text('submit'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
