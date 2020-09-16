import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

QuizFriend qb = QuizFriend();

void main() {
  runApp(Quiz());
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];
  List<String> ans = ["true", "false", "false"];
  int n = 0;
  int p = 0;
  int points = 0;
  void changeval(bool yourAnswer) {
    bool correctAns = qb.getAnswer();
    setState(() {
      if (qb.isFinished() == true) {
        Alert(
          context: context,
          title: 'Done!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        qb.reset();
        score = [];
      } else {
        if (yourAnswer == correctAns) {
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
    return Container(
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
                body: SafeArea(
                    child: Center(
                        child: Column(
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
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
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
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
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
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
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
                ))))));
  }
}

/* music app
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

void soundPlay(int v) {
  final p = AudioCache();
  p.play("note$v.wav");
}
//both stateless and stateful have build , but in stateless build is called only once wherein statefull, 
//build is called frequently when there is change in state
Expanded createWidget({String s, Color c, int n}) {        //use expanded to fill the buttons along the main axix without any gap
  return Expanded(
    child: FlatButton(
      child: Text(s),
      color: c,
      onPressed: () {
        soundPlay(n);
      },
    ),
  );
}

//type "stless" then press enter and select pop up
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              createWidget(s: "Sa", c: Colors.purple[50], n: 1),
              createWidget(s: "Re", c: Colors.purple[100], n: 2),
              createWidget(s: "Ga", c: Colors.purple[200], n: 3),
              createWidget(s: "Ma", c: Colors.purple[300], n: 4),
              createWidget(s: "Pa", c: Colors.purple[400], n: 5),
              createWidget(s: "Dha", c: Colors.purple[500], n: 6),
              createWidget(s: "Ni", c: Colors.purple[600], n: 7),
            ])),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/wooden.jpg"), fit: BoxFit.cover)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.transparent,
            //backgroundImage: AssetImage('images/wooden.jpg'),
            appBar: AppBar(
              title: Text("Magic Ball 8"),
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
                child: Center(
                    child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                CircleAvatar(
                  radius: 180.0,
                  //backgroundColor: Colors.amber,
                  backgroundImage: AssetImage('images/img2.png'),
                ),
              ],
            ))),
          ),
        ));
  }
}
*/
//if stateful then built is called which calls setState widget and checks wat all is changed
/*
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void soundPlay() {
  final p = AudioCache();
  p.play("bounce.wav");
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int advice = 0;
  String txtmes = "Ask a question and click on the ball";
  void changeval() {
    setState(() {
      if (advice == 0) {
        txtmes = "Wish you Luck!";
      }
      advice = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/wooden.jpg"), fit: BoxFit.cover)),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                backgroundColor: Colors.transparent,
                //backgroundImage: AssetImage('images/wooden.jpg'),
                appBar: AppBar(
                  title: Text(
                    "Magic 8 Ball",
                    style: TextStyle(
                        fontFamily: 'Lob',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                  backgroundColor: Colors.black,
                ),
                body: SafeArea(
                    child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            soundPlay();
                            changeval();
                          },
                          child: CircleAvatar(
                            radius: 180.0,
                            //backgroundColor: Colors.amber,
                            backgroundImage:
                                AssetImage('images/img$advice.png'),
                          ),
                        ),
                        SizedBox(
                          height: 90.0,
                        ),
                        Text(
                          txtmes,
                          style: TextStyle(
                              //fontFamily: 'Lob',
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                )))));
  }
}
*/
