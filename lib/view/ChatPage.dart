import 'dart:async';
import 'package:flutter/material.dart';

import 'chat_gpt.dart';

class ChatPage extends StatefulWidget {
  const ChatPage();

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textcontroller = TextEditingController();
  List messges = [];
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    messges.insert(0, {
      'sender': 'GPT',
      'message': "Hello I am an AI Docter, Tell me how You feel?"
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void gptMessage(String message) async {
    var answer = "";
    setState(() {
      isTyping = true;
    });
    try {
      final response = await sendMessage(message);
      answer = response['message']['content'];
    } catch (e) {
      print(e);
    }
    setState(() {
      messges.insert(0, {'sender': 'GPT', 'message': answer});
      isTyping = false;
    });
  }

  Future<void> UserMessge(String message) async {
    if (!(identical(message, ""))) {
      print(message);
      setState(() {
        messges.insert(0, {'sender': 'user', 'message': message});
      });

      gptMessage(message);
      textcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.805,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue.withOpacity(0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: messges.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: (messges[index]['sender'] == 'user')
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Material(
                          borderRadius: (messges[index]['sender'] == 'user')
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )
                              : BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                          elevation: 6,
                          color: (messges[index]['sender'] == 'user')
                              ? Color.fromARGB(255, 56, 132, 152)
                              : Color(0xff4DB7D1),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              messges[index]['message'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: size.width,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2, color: Colors.blue.shade200),
            ),
            padding: EdgeInsets.all(10),
            height: 60,
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textcontroller,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration.collapsed(
                      hintText: "Write Here",
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                isTyping
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          UserMessge(textcontroller.text);
                        },
                        icon: Icon(Icons.send),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
