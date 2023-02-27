import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String data = "Tidak ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete"),
        actions: [
          IconButton(
            onPressed: () async {
              var response =
                  await http.get(Uri.parse("https://reqres.in/api/users/3"));
              Map<String, dynamic> body = json.decode(response.body);
              setState(() {
                data =
                    "${body['data']['first_name']} ${body['data']['last_name']}";
              });
            },
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              var response =
                  await http.delete(Uri.parse("https://reqres.in/api/users/3"));
              if (response.statusCode == 204) {
                setState(() {
                  data = "Data Berhasil dihapus";
                });
              }
            },
            child: Text(
              "Hapus",
            ),
          )
        ],
      ),
    );
  }
}
