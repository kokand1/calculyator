import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestion = "";
  var userAnsver = "";
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    ".",
    "0",
    "000",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(userQuestion,style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(userAnsver,style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, int index) {
                  if (index == 0) {
                    return Mybutton(
                      buttontapped: (){
                       setState(() {
                          userQuestion = "";
                       });
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  } else if (index == 1) {
                    return Mybutton(
                      buttontapped: (){
                        setState(() {
                         if (userQuestion.isNotEmpty) {
  userQuestion = userQuestion.substring(0, userQuestion.length - 1);
}
                        });
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  } else if (index == buttons.length-1) {
                    return Mybutton(
                      buttontapped: (){
                        setState(() {
                        aqualpresed();
                        });
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  }
                  else {
                    return Mybutton(
                      buttontapped: (){
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      color:
                          isOperators(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                      textColor:
                          isOperators(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                      buttonText: buttons[index],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperators(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" ) {
      return true;
    }
    return false;
  }


  void aqualpresed (){
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*" );
    ExpressionParser p = GrammarParser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
   double eval = exp.evaluate(EvaluationType.REAL, cm);
   userAnsver = eval.toString();
  }
}
