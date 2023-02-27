import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myHttp;

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
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilresponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Put"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Job",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await myHttp.put(
                //put/patch
                Uri.parse("https://reqres.in/api/users/1"),
                body: {"name": nameC.text, "job": jobC.text},
              );

              Map<String, dynamic> data =
                  jsonDecode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                hasilresponse = "${data['name']} - ${data['job']}";
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          Text(hasilresponse),
        ],
      ),
    );
  }
}
