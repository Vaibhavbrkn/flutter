import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blue,
          ),
          body: Magic(),
        ),
      ),
    );

class Magic extends StatefulWidget {
  @override
  _MagicState createState() => _MagicState();
}

class _MagicState extends State<Magic> {

  int answer = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:FlatButton(
        onPressed:() {
          setState(() {
            answer = Random().nextInt(5) + 1;
          });
        },
        child:Image.asset('images/ball$answer.png'),
      )
    );
  }
}
