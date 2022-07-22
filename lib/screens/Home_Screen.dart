import 'dart:math';

import 'package:calculator/constants/constants.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String exp = '';
  String history = '';
  double num1 = 0;
  double num2 = 0;
  String op = '';
  void numClick(String btnText) {
    if (btnText == 'AC') {
      setState(() {
        exp = '';
        history = '';
      });
      num1 = 0;
      num2 = 0;
    } else if (btnText == 'C') {
      setState(() {
        exp = '';
      });
    } else if (btnText == '%' ||
        btnText == '+' ||
        btnText == 'x' ||
        btnText == '-' ||
        btnText == '/') {
      op = btnText;
      num1 = double.parse(exp);

      setState(() {
        exp = '';
        history = num1.toString();
        history += btnText;
      });
    } else if (btnText == '.') {
      if (exp.contains('.')) {
      } else {
        setState(() {
          exp += btnText;
        });
      }
    } else if (btnText == "=") {
      num2 = double.parse(exp);
      history += exp;

      switch (op) {
        case '+':
          {
            exp = (num1 + num2).toString();
          }
          break;

        case '/':
          {
            num2 == 0 ? exp = "Undefiend" : exp = (num1 / num2).toString();
          }
          break;

        case 'x':
          {
            exp = (num1 * num2).toString();
          }
          break;

        case '%':
          {
            exp = (num1 % num2).toString();
          }
          break;

        case '-':
          {
            exp = (num1 - num2).toString();
          }
          break;

        default:
          break;
      }

      setState(() {});
    } else {
      setState(() {
        exp = exp + btnText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Constant.textAlignment,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              history,
              style: Constant.style1,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 3,
            height: 2,
          ),
          Container(
            alignment: Constant.textAlignment,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              exp,
              style: Constant.style1,
            ),
          ),
          Row(
            children: [
              CustomButton(
                callback: numClick,
                buttonColor: Colors.blue,
                textButton: 'AC',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.amber,
                textButton: 'C',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.teal,
                textButton: '%',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.red,
                textButton: '/',
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callback: numClick,
                buttonColor: Colors.blue,
                textButton: '7',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.amber,
                textButton: '8',
              ),
              CustomButton(
                  callback: numClick,
                  buttonColor: Colors.teal,
                  textButton: '9'),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.red,
                textButton: 'x',
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callback: numClick,
                buttonColor: Colors.blue,
                textButton: '4',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.amber,
                textButton: '5',
              ),
              CustomButton(
                  callback: numClick,
                  buttonColor: Colors.teal,
                  textButton: '6'),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.red,
                textButton: '-',
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callback: numClick,
                buttonColor: Colors.blue,
                textButton: '1',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.amber,
                textButton: '2',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.teal,
                textButton: '3',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.red,
                textButton: '+',
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callback: numClick,
                buttonColor: Colors.blue,
                textButton: '0',
                btnFlex: 2,
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.amber,
                textButton: '.',
              ),
              CustomButton(
                callback: numClick,
                buttonColor: Colors.teal,
                textButton: '=',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
