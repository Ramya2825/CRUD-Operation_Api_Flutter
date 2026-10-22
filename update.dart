
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Emptypage extends StatefulWidget {
  @override
  State<Emptypage> createState() => _EmptypageState();
}

class _EmptypageState extends State<Emptypage> {
  String result = 'update data';

Future<void> sendupdaterequest(int id, Map<String, dynamic> updatedData) async{
  
  final url = Uri.parse('https://jsonplaceholder.typicode.com/put');
  try {
    final response = await http.put(url,headers: <String, String>{
      'Content-Type':'application/json; charset=UTF-8',
    },
      body: jsonEncode(updatedData),
    );
    if(response.statusCode==201 || response.statusCode==200){
      print('Updated successfully');
    }else {
      print('server issues:${response.statusCode}');
    }
  } catch (error) {
    print('network error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Put Request'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => sendupdaterequest(1, {
                  'title': 'Updated title',
                  'body': 'Updated body',
                  'userId': 1,
                }),
                child: Text('Send  Request'),
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}
