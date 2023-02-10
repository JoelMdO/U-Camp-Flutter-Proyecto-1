import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final int numbercounterfinal;
  const Counter(this.numbercounterfinal, {super.key});

  void initState() {
    Counter(numbercounterfinal);
  }

  @override
  // ignore: no_logic_in_create_state
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              //ANIMATED CONTAINER TO CHANGE THE BACKGROUND COLOR
              child: AnimatedContainer(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: selected
                              ? const AssetImage('assets/Orange Background.jpg')
                              : const AssetImage('assets/Green Background.jpg'),
                          fit: BoxFit.cover)),
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //COUNTER TEXT
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white38,
                            child: CircleAvatar(
                              backgroundImage: const AssetImage(
                                  'assets/Green Background.jpg'),
                              radius: 50,
                              child: Text(
                                '$_counter',
                                style: const TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                      //BUTTON NEW TO CLEAR THE DATA
                      IconButton(
                        icon: Image.asset("assets/Newnew.png"),
                        tooltip: 'Increase number',
                        iconSize: 80,
                        onPressed: () {
                          setState(() {
                            _counter = 0;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //BUTTON PLUS
                          IconButton(
                            icon: Image.asset('assets/Plus.png'),
                            tooltip: 'Increase number',
                            iconSize: 100,
                            onPressed: () {
                              setState(() {
                                if (widget.numbercounterfinal != 0) {
                                  _counter =
                                      _counter += widget.numbercounterfinal;
                                } else {
                                  _counter++;
                                }
                              });
                            },
                          ),
                          //BUTTON MINUS
                          IconButton(
                            icon: Image.asset('assets/Minus.png'),
                            tooltip: 'Decrease number',
                            iconSize: 100,
                            onPressed: () {
                              setState(() {
                                if (widget.numbercounterfinal != 0) {
                                  _counter =
                                      _counter -= widget.numbercounterfinal;
                                } else {
                                  _counter--;
                                }
                              });
                            },
                          )
                        ],
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      Padding(
                          padding: const EdgeInsets.only(top: 50, left: 100),
                          child: Image.asset(
                            'assets/ChangeBackground.png',
                            width: 80,
                            height: 80,
                          )),
                    ],
                  )),
            )));
  }
}
