import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({Key? key}) : super(key: key);
  final String _title = 'letsDice';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          title: Text(
            _title,
            style: const TextStyle(
              fontFamily: 'KdamThmorPro',
              letterSpacing: 1.5,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int sumOfDice = 0;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      sumOfDice = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sumOfDice.toString(),
          style: const TextStyle(
            fontFamily: 'KdamThmorPro',
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              flex: leftDiceNumber > rightDiceNumber ? 2 : 1,
              child: TextButton(
                onPressed: () => changeDiceFace(),
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              flex: leftDiceNumber < rightDiceNumber ? 2 : 1,
              child: TextButton(
                onPressed: () => changeDiceFace(),
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
