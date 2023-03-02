import 'package:flutter/material.dart';
import 'package:rpn_calculator_assignment/backend/Command.dart';
import 'package:rpn_calculator_assignment/stack_view.dart';
import 'package:rpn_calculator_assignment/user_input_view.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  /// Type = String so that we can use "." in our calculator
  List<String> userInput = [];
  List<num> numberStack = [];
  String result = '';
  String operator = '';


  List<num> enter() {
    setState(() {
      for (String number in userInput) {
        result += number;
      }

      /// Parse the string as a "num" so we can add it to the stack
      num numberFromString = num.parse(result);
      numberStack.add(numberFromString);
      userInput.clear();

      /// Makes it a new string every time you press "Enter"
      result = '';
    });
    return numberStack.toList();
  }

  void clear() {
    setState(() {
      numberStack.clear();
    });
  }

  void undo() {
    setState(() {
      userInput.removeLast();
    });
  }

  void calculation(String operator) {
    num newValue;
    setState(() {
      num lastInput = numberStack.last;
      num secondLastInput = numberStack.elementAt(numberStack.length - 2);
      numberStack.remove(lastInput);
      numberStack.remove(secondLastInput);
      switch (operator) {
        case '+':
          newValue = Addition(lastInput, secondLastInput).execute();
          numberStack.add(newValue);
          break;
        case '-':
          newValue = Subtraction(lastInput, secondLastInput).execute();
          numberStack.add(newValue);
          break;
        case '*':
          newValue = Multiply(lastInput, secondLastInput).execute();
          numberStack.add(newValue);
          break;
        case '/':
          newValue = Division(lastInput, secondLastInput).execute();
          numberStack.add(newValue);
          break;
      }
      numberStack.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPN Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RPN Calculator'),
        ),
        backgroundColor: Colors.grey[400],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StackView(numberStack),
            UserInputView(userInput),
            _firstButtonRow(),
            _secondButtonRow(),
            _thirdButtonRow(),
            _fourthButtonRow(),
            _fifthButtonRow(),
          ],
        ),
      ),
    );
  }


  Widget _fifthButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  numberStack.clear();
                  userInput.clear();
                });
              },
              child: Text(
                'AC',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('0');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '0',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('.');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '.',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                enter();
              },
              child: Text(
                'Enter',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fourthButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('1');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '1',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('2');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '2',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('3');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '3',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                operator = '+';
                calculation(operator);
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _thirdButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('4');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '4',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('5');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '5',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('6');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '6',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                operator = '-';
                calculation(operator);
              },
              child: Text(
                '-',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _secondButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('7');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '7',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('8');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '8',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                userInput.add('9');
                setState(() {
                  userInput.join('');
                });
              },
              child: Text(
                '9',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                operator = '*';
                calculation(operator);
              },
              child: Text(
                '*',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                clear();
              },
              child: Text(
                'Clear',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                undo();
              },
              child: Text(
                'Undo',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                operator = '%';
                calculation(operator);
              },
              child: Text(
                '%',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                operator = '/';
                calculation(operator);
              },
              child: Text(
                '/',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
