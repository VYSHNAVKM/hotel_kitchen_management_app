import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/view/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCMgwlDjhVxviKP0_2ot18wO0ECq0pcd7M",
          appId: "1:994341369986:android:0d9c3004f887f7370d1c9b",
          messagingSenderId: "",
          projectId: "hotel-kitchen-management-e61c6",
          storageBucket: "hotel-kitchen-management-e61c6.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserinterfaceScreen(),
    );
  }
}
