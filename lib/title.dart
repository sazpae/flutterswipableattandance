import 'package:flutter/material.dart';
import 'package:flutter_tinder/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Attandance'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 19, 87, 133),
          ),
        ));
  }
}
