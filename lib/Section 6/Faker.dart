import 'package:flutter/material.dart';

import 'package:faker/faker.dart';

class HomePage extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Faker"),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(""),
            ),
            title: Text("${faker.person.name()}"),
            subtitle: Text("${faker.person}"),
          ),
        ));
  }
}
