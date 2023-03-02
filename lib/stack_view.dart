import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  final List<num> numberStack;
  const StackView(this.numberStack, {Key? key}) : super(key: key);

  String _displayStack() {
    if (numberStack.isEmpty) {
      return '';
    }
    return numberStack.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1.0, 1.0),
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: Text(
          _displayStack(),
          style: TextStyle(fontSize: 25, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
