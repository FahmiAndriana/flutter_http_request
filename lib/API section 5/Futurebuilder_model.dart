import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request/API%20section%205/models/user.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> allUser = [];
  Future getAllUser() async {
    try {
      var response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      var data = (jsonDecode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(UserModel.fromJson(element));
      });
    } catch (e) {
      print("Terjadi kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading...."),
            );
          } else {
            if (allUser.length == 0) {
              return Center(
                child: Text("Tidak ada data"),
              );
            }
            return ListView.builder(
              itemCount: allUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${allUser[index].avatar}"),
                  backgroundColor: Colors.grey[300],
                ),
                title: Text(
                    "${allUser[index].firstName} ${allUser[index].lastName}"),
                subtitle: Text("${allUser[index].email}"),
              ),
            );
          }
        },
      ),
    );
  }
}
