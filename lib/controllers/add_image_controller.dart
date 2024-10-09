import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageController with ChangeNotifier {
  String? image ;

  Future pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = pickedImage.path;
    }
    notifyListeners();
  }

  Future pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = pickedImage.path;
    }
    notifyListeners();
  }

  bool imageValidate(BuildContext context) {
    if (image==null) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const SnackBar(
            content: Text('image not added'),
            backgroundColor: Colors.red,
          );
        },
      ));
      return false;
    }
    return true;
  }

  void clearImage(){
    image=null;
    notifyListeners();
  }
}
