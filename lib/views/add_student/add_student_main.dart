import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/add_image_controller.dart';
import 'package:student_provider/controllers/student_data_controller.dart';
import 'package:student_provider/widgets/add_images/add_images_main.dart';
import 'package:student_provider/widgets/my_text_form_field.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController phoneNocontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              key: _formKey,
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
                      keyboardType: TextInputType.number),
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
                        if (_formKey.currentState!.validate()) {
                          Provider.of<StudentDataController>(context,
                                  listen: false)
                              .addStudent(
                            name: namecontroller.text,
                            age: agecontroller.text,
                            phoneNumber: phoneNocontroller.text,
                            image: Provider.of<AddImageController>(context,
                                    listen: false)
                                .image
                                .toString(),
                          );
                          Provider.of<AddImageController>(context,
                                  listen: false)
                              .clearImage();

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
