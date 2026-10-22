import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rest API Calls'),),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final user = users[index];
          final name = user['name']['first'] as String;
          final email = user['email']as String;
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}'),),
           
            title: Text(name),
            subtitle: Text(email),
          );
        }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers,),
    );
  }

void fetchUsers() async{
  print('fetchUsers called');
  const url = 'https://randomuser.me/api/?results=100';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  setState(() {
    users = List<Map<String, dynamic>>.from(json['results']);
  });
print('fetchUsers completed');
}
}