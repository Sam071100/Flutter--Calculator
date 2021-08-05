import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int firstnum;
  int secondnum;
  String texttoDisplay = '';
  String res;
  String operatortoPer;
  void buttonclicked(String buttonval) {
    if (buttonval == 'C') {
      texttoDisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
    } else if (buttonval == '+' ||
        buttonval == '-' ||
        buttonval == 'x' ||
        buttonval == '/') {
      firstnum = int.parse(texttoDisplay);
      res = '';
      operatortoPer = buttonval;
    } else if (buttonval == '=') {
      secondnum = int.parse(texttoDisplay);
      if (operatortoPer == '+') {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoPer == '-') {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoPer == 'x') {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoPer == '/') {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttoDisplay + buttonval).toString();
    }

    setState(() {
      texttoDisplay = res;
    });
  }

  // Creating our own widget
  Widget customButton(String buttonval) {
    return Expanded(
      // child: Padding(
      //   padding: const EdgeInsets.all(0),
      child: OutlinedButton(
        onPressed: () => buttonclicked(buttonval),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            '$buttonval',
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
        ),
      ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calculate_rounded,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '$texttoDisplay',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  customButton('7'), // Custom Wideget
                  customButton('8'),
                  customButton('9'),
                  customButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton('4'),
                  customButton('5'),
                  customButton('6'),
                  customButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton('1'),
                  customButton('2'),
                  customButton('3'),
                  customButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton('C'),
                  customButton('0'),
                  customButton('='),
                  customButton('/'),
                ],
              ),
            ],
          ),
        ));
  }
}
