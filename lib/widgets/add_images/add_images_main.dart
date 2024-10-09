import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/add_image_controller.dart';
import 'package:student_provider/widgets/add_images/bottom_sheet.dart';

class AddImagesMain extends StatelessWidget {
  const AddImagesMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddImageController>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return MyBottomSheet();
            },
          );
        },
        child: (value.image!=null)
            ? SizedBox(
                width: 300,
                height: 300,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                      File(
                        value.image.toString(),
                      ),
                      fit: BoxFit.cover,
                    )),
              )
            : Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.black12,
                        size: 80,
                      ),
                      Text(
                        'Add Image Here',
                        style: TextStyle(
                            color: Colors.black12,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
