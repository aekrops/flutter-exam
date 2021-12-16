import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'dart:math';

import '../data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> leftList = getList(Random().nextInt(6) + 5, "Left");
  List<dynamic> rightList = getList(Random().nextInt(6) + 5, "Right");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [list(context, leftList), list(context, rightList)],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: addItem,
          tooltip: 'Increment',
          child: const Icon(Icons
              .add)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  addItem(){
      setState(() {
        bool isLeft = Random().nextBool();
        if (isLeft){
          int randElementIdx = Random().nextInt(leftList.length - 1);
          MyList element = leftList.elementAt(randElementIdx);
          leftList.removeAt(randElementIdx);
          element.color = Colors.red;
          rightList.add(element);
        } else {
          int randElementIdx = Random().nextInt(rightList.length - 1);
          MyList element = rightList.elementAt(randElementIdx);
          rightList.removeAt(randElementIdx);
          element.color = Colors.red;
          leftList.add(element);
        }
      });
  }

  Widget list(BuildContext context, List list) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
          children: list.map((side) => card(context, side.title, side.color)).toList()),
    );
  }

  Widget card(BuildContext context, String title, Color color) {
    return Container(
        color: color,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(title));
  }
}
