import 'package:flutter/material.dart';
import 'package:resturant_app/ui/homepage/home_page.dart';
import 'package:resturant_app/ui/homepage/home_page_background.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        scaffoldBackgroundColor:Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFF4700),

      ),
      home: HomePage(),
    );
  }
}
