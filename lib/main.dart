import 'package:flutter/material.dart';
import 'package:http_request/Section%206/Faker.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Search"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
          ),
          items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Menu mode",
              hintText: "country in menu mode",
            ),
          ),
          onChanged: print,
          selectedItem: "Brazil",
        ),
      ),
    );
  }
}
