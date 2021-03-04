import 'package:flutter/material.dart';
import 'package:guess_the_word/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Guess the word'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}
