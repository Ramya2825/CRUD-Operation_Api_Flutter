
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Closepage extends StatefulWidget {
  @override
  State<Closepage> createState() => _ClosepageState();
}

class _ClosepageState extends State<Closepage> {

Future<bool> deleteItem(String id) async {
  final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/');

  try {
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Deleted successfully.');
      return true;
    } else {
      print('Failed to delete: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (error) {
    print('Error occurred while deleting: $error');
    return false;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Request'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => deleteItem('1'),
                child: Text('Delete Request'),
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}
