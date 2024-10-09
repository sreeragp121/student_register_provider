import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/add_image_controller.dart';
class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: Colors.white),
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Choos Profile Photo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                          Provider.of<AddImageController>(context,listen: false).pickImageFromCamera();
                          Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.camera,
                        size: 70.0,
                      ),
                    ),
                    const Text(
                      'CAMERA',
                      style: TextStyle(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              SizedBox(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<AddImageController>(context,listen: false).pickImageFromGallery();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.photo,
                        size: 70.0,
                      ),
                    ),
                    const Text(
                      'GALLERY',
                      style: TextStyle(),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
