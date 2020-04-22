import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page.'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Start the quiz."),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QuizPage()));
            }),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questionAnswers = [
    {
      'question': 'Q1: Who invented JavaScript?',
      'options': [
        'Douglas Crockford',
        'Sheryl Sandberg',
        'Brendan Eich',
        'john cena'
      ],
      'ans': 3
    },
    {
      'question': 'Q2: Which one of these is a JavaScript package manager?',
      'options': ['Node.js', 'TypeScript', 'NPM', 'PIP'],
      'ans': 3
    },
    {
      'question': 'Q3: Which tool can you use to ensure code quality?',
      'options': ['Angular', 'Jquery', 'RequireJS', 'ESLint'],
      'ans': 4
    },
    {
      'question': 'Q4: In which year did Maradona score a goal with his hand?',
      'options': ['1986', '1976', '1996', '1992'],
      'ans': 1
    },
    {
      'question': 'Q5: What country won the very first FIFA World Cup in 1930?',
      'options': ['Brazil', 'Argentina', 'Nepal', 'Uruguay'],
      'ans': 4
    },
    {
      'question': 'Q6: What does “HTTP” stand for?',
      'options': [
        'HyperText Transfer Protocal',
        'Hypertext transmission protocal',
        'Internet Protocol',
        'Hypertext markup language'
      ],
      'ans': 1
    },
    {
      'question': 'Q7: Which email service is owned by Microsoft?',
      'options': ['Hotmail', 'Gmail', 'Coldmail', 'Yupmail'],
      'ans': 1
    },
    {
      'question': 'Q8: Who is often called the father of the computer?',
      'options': [
        'Charles Babbage',
        'Charles messi',
        'Charles ronaldo',
        'Isaac Newton'
      ],
      'ans': 1
    },
    {
      'question': 'Q9: Who is the founder of facebook?',
      'options': ['Mark Zuckerberg', 'Bill Gates', 'Bill Doors', 'Tim Cook'],
      'ans': 1
    },
    {
      'question': 'Q10: Who is the capital city of Nepal?',
      'options': ['Bhaktapur', 'Kathmandu', 'Delhi', 'London'],
      'ans': 2
    },
  ];

  var message = '';

  var counter = 0;

  checkAns(answerIndex) {
    if (questionAnswers[counter]['ans'] == answerIndex + 1) {
      if (counter + 1 == questionAnswers.length) {
        setState(() {
          message = 'Quiz completed. Thank you';
        });
        Timer(Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      } else {
        setState(() {
          message = '';
          counter++;
        });
      }
    } else {
      setState(() {
        message = 'Wrong answer. please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Container(
        margin: const EdgeInsets.all(64),
        child: Center(
          child: Column(
            children: [
              Text(
                '${questionAnswers[counter]['question']}',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.only(top: 64),
                child: new Column(
                  children: [
                    ButtonTheme(
                      minWidth: 200,
                      child: RaisedButton(
                          onPressed: () {
                            checkAns(0);
                          },
                          child: Text(
                              '${List.of(questionAnswers[counter]['options'])[0]}')),
                    ),
                    ButtonTheme(
                      minWidth: 200,
                      child: RaisedButton(
                          onPressed: () {
                            checkAns(1);
                          },
                          child: Text(
                              '${List.of(questionAnswers[counter]['options'])[1]}')),
                    ),
                    ButtonTheme(
                      minWidth: 200,
                      child: RaisedButton(
                          onPressed: () {
                            checkAns(2);
                          },
                          child: Text(
                              '${List.of(questionAnswers[counter]['options'])[2]}')),
                    ),
                    ButtonTheme(
                      minWidth: 200,
                      child: RaisedButton(
                          onPressed: () {
                            checkAns(3);
                          },
                          child: Text(
                              '${List.of(questionAnswers[counter]['options'])[3]}')),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  '${message}',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
