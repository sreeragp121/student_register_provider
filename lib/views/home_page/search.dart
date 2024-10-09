import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/student_data_controller.dart';


class MySearchBar extends StatelessWidget {
   const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        
      
        onChanged: (value) {
         Provider.of<StudentDataController>(context,listen: false).searchName(value);
        },
        decoration: InputDecoration(
          filled: true,
            hintText: 'search',
            suffixIcon: IconButton(
                onPressed: () async {}, icon: const Icon(Icons.search)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
