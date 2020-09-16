import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

QuizFriend qb = QuizFriend();

void main() {
  runApp(Container(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: Colors.black,
              //backgroundImage: AssetImage('images/wooden.jpg'),
              appBar: AppBar(
                title: Text(
                  "F.R.I.E.N.D.S Trivia",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.pink[700],
              ),
              body: SafeArea(child: Center(child: Quiz()))))));
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];
  int result = 0;
  List<String> ans = ["true", "false", "false"];
  int n = 0;
  int p = 0;
  int points = 0;
  void changeval(bool yourAnswer) {
    bool correctAns = qb.getAnswer();
    setState(() {
      if (qb.isFinished() == true) {
        if (yourAnswer == correctAns) {
          result++;
        }
        Alert(
          context: context,
          title: 'Done!',
          desc: 'You\'r score is :' + result.toString(),
        ).show();

        result = 0;
        qb.reset();
        score = [];
      } else {
        if (yourAnswer == correctAns) {
          result++;
          score.add(Icon(
            Icons.check,
            color: Colors.lightGreen,
          ));
        } else {
          score.add(
            Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
          );
        }
        qb.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "True",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              onPressed: () {
                changeval(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "False",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                changeval(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
