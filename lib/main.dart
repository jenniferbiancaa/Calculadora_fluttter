import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '';
  String operand1 = '';
  String operand2 = '';
  String operator = '';
  String expression = '';

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        // limpar a calculadora...
        result = '';
        operand1 = '';
        operand2 = '';
        operator = '';
        expression = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '/') {
        operand1 = result;
        operator = buttonText;
        result = '';
        expression += buttonText;
        // ...configurar o operando e o operador...
      } else if (buttonText == '.') {
        // ...lidar com o ponto decimal...
        if (!result.contains('.')) {
          result += '.';
          expression += buttonText;
        }
      } else if (buttonText == '=') {
        operand2 = result;
        // executar o cálculo atual
        double num1 = double.parse(operand1);
        double num2 = double.parse(result);
        if (operator == '+') {
          result = (num1 + num2).toString();
        } else if (operator == '-') {
          result = (num1 - num2).toString();
        } else if (operator == 'x') {
          result = (num1 * num2).toString();
        } else if (operator == '/') {
          result = (num1 / num2).toString();
        }
        operand1 = '';
        operator = '';
        operator = '';
        expression += '=$result';
      } else {
        // result += buttonText;
        result += buttonText;
        expression += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 24.0,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                child: Text(
                  expression,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  //  result,
                  // style: TextStyle(
                  //   fontSize: 48.0,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Row(
                children: <Widget>[
                  buildButton('7', Colors.grey[300]!, Colors.black),
                  buildButton('8', Colors.grey[300]!, Colors.black),
                  buildButton('9', Colors.grey[300]!, Colors.black),
                  buildButton(
                      '/', Color.fromARGB(255, 255, 0, 106), Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4', Colors.grey[300]!, Colors.black),
                  buildButton('5', Colors.grey[300]!, Colors.black),
                  buildButton('6', Colors.grey[300]!, Colors.black),
                  buildButton(
                      'x', Color.fromARGB(255, 255, 0, 106), Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1', Colors.grey[300]!, Colors.black),
                  buildButton('2', Colors.grey[300]!, Colors.black),
                  buildButton('3', Colors.grey[300]!, Colors.black),
                  buildButton(
                      '-', Color.fromARGB(255, 255, 0, 106), Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('.', Colors.grey[300]!, Colors.black),
                  buildButton('0', Colors.grey[300]!, Colors.black),
                  buildButton('00', Colors.grey[300]!, Colors.black),
                  buildButton(
                      '+', Color.fromARGB(255, 255, 0, 106), Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('C', Colors.grey[300]!, Colors.black),
                  buildButton(
                      '=', Color.fromARGB(255, 255, 0, 106), Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
