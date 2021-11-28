import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:game_memory_card/constants.dart';

int level = 12;

class GamePage extends StatefulWidget {
  final int size;

  const GamePage({Key? key, this.size = 12}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];
  int previousIndex = -1;
  bool flip = false;

  int time = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    startTimer();
    data.shuffle();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        time = time + 1;
      });
    });
  }

  cancelTimer() {
    timer.cancel();
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft =
        h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Game'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Tempo: ${intToTimeLeft(time)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) => FlipCard(
                                key: cardStateKeys[index],
                                onFlip: () {
                                  if (!flip) {
                                    flip = true;
                                    previousIndex = index;
                                  } else {
                                    flip = false;
                                    if (previousIndex != index) {
                                      if (data[previousIndex] != data[index]) {
                                        cardStateKeys[previousIndex]
                                            .currentState!
                                            .toggleCard();
                                        previousIndex = index;
                                      } else {
                                        cardFlips[previousIndex] = false;
                                        cardFlips[index] = false;
                                        if (cardFlips
                                            .every((t) => t == false)) {
                                          print('terminou');
                                          cancelTimer();
                                        }
                                      }
                                    }
                                  }
                                },
                                direction: FlipDirection.HORIZONTAL,
                                flipOnTouch: cardFlips[index],
                                front: Container(
                                  margin: EdgeInsets.all(4.0),
                                  color: Colors.deepOrange.withOpacity(0.3),
                                ),
                                back: Container(
                                  margin: EdgeInsets.all(4.0),
                                  color: Colors.deepOrange,
                                  child: Center(
                                    child: Text(
                                      "${data[index]}",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Terminou!"),
        content: Text(
          "Tempo: ${intToTimeLeft(time)}",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GamePage(
                    size: level,
                  ),
                ),
              );
              level *= 6;
            },
            child: Text("NEXT"),
          ),
        ],
      ),
    );
  }
}
