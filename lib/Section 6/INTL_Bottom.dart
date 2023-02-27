import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http_request/API%20section%205/Futurebuilder_model.dart';
import 'Faker.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();

  String tanggal = DateTime.now().toIso8601String();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("https://picsum.photos/${index + 200}/300/"),
          ),
          title: Text("${faker.person.name()}"),
          subtitle: Text(
              "${DateFormat.yMMMMEEEEd().add_jms().format(DateTime.parse(tanggal))}"),
        ),
      ),
      Center(child: Text("Halaman k 2")),
      Center(child: Text("Halaman k 3")),
      Center(child: Text("Halaman k 4")),
      Center(child: Text("Halaman k 5")),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Faker, bottom & INTL"),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: Colors.blue[700],
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
