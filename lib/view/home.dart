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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 116, 145),
          title: Text(
            "Chat Csc489",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade900, Colors.blue.shade200],
              ),
            ),
            child: ChatPage()),
      ),
    );
  }
}
