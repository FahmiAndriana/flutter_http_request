import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Glow"),
      ),
      body: Center(
        child: AvatarGlow(
          endRadius: 150.0,
          glowColor: Colors.black,
          child: Material(
            // Replace this child with your own
            elevation: 8.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: NetworkImage('https://picsum.photos/200'),
              radius: 60.0,
            ),
          ),
        ),
      ),
    );
  }
}
