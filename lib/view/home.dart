import 'package:flutter/material.dart';
import 'ChatPage.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Home'),
        ),
        body: Container(
          child: Center(
            child: ChatPage(),
          ),
        ),
      ),
    );
  }
}
