
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String result = 'send post data';

Future<void> sendpostrequest() async{
  
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  try {
    final response = await http.post(url,headers: <String, String>{
      'Content-Type':'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, String>{}),
    );
    if(response.statusCode==201 || response.statusCode==200){
      print('code successfully');
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
        title: Text('POST Request'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: sendpostrequest,
                child: Text('Send POST Request'),
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}
