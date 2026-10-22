
import 'package:apikey_project/delete.dart';
import 'package:apikey_project/home/create.dart';
import 'package:apikey_project/putupdate/update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       
        body:Closepage(),


      ),
    );
  }
}