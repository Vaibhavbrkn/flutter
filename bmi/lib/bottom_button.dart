import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap , this.buttonTitle});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        color:Color(0xFFEB1555),
        padding: EdgeInsets.only(bottom: 15.0),
        margin: EdgeInsets.only(top:10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}