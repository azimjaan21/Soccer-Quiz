import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:soccerquiz/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => HomeScreen(),),
    ],
      
      title: 'Soccer Quiz',
      debugShowCheckedModeBanner: false,
     
    );
  }
}
