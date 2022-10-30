import 'package:flutter/material.dart';
import 'package:food_order/Screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Order Food"),
      ),
      body: const Welcome(),
    ),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
