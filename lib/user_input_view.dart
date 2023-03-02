import 'package:flutter/material.dart';

class UserInputView extends StatelessWidget {
  final List<String> userInput;

  const UserInputView(this.userInput, {Key? key}) : super(key: key);

  String _displayUserInput() {
    if (userInput.isEmpty) {
      return '0';
    }
    return userInput.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1.0, 1.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          _displayUserInput(),
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
      ),
    );;
  }
}
