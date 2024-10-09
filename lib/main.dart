import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controllers/add_image_controller.dart';
import 'package:student_provider/controllers/student_data_controller.dart';
import 'package:student_provider/models/student_model.dart';
import 'package:student_provider/views/splash_screen/splash_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.openBox<StudentModel>('studentBox');
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddImageController(),),
        ChangeNotifierProvider(create: (context) => StudentDataController(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MySplashScreen(),
      ),
    );
  }
}