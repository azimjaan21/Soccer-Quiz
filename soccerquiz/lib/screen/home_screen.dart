import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soccerquiz/screen/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
bool iconbool = false;
IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: iconbool ? darkTheme : lightTheme,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/595229/pexels-photo-595229.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
              IconButton(
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    iconbool = !iconbool;
                  });
                },
                icon: Icon(
                  iconbool ? iconDark : iconLight,
                ),
              ),
                  ],
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.to(QuizScreen());
                      },
                      icon: Icon(Icons.straight),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                RichText(text: TextSpan(
                  style: TextStyle(color: Colors.amber, fontSize: 18),
                  children: [
                  TextSpan(text: 'Powered by '),
                  TextSpan(text: 'azimjaan21', style: TextStyle( color: Colors.blue)),
                  ]
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
