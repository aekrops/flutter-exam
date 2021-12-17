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
  List<dynamic> redList = [];
  bool isFive= false;
  List<dynamic> redElementInLeftColumn = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [list(context, leftList), list(context, rightList)],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(onPressed: buttonOne, backgroundColor: Colors.grey),
                    (isFive)
                        ? FloatingActionButton(onPressed: buttonTwo,  backgroundColor: Colors.red)
                        : Container()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buttonOne() {
    setState(() {
      bool isLeft = Random().nextBool();

      if (isLeft) {
        int randElementIdx = Random().nextInt(leftList.length - 1);
        MyList element = leftList.elementAt(randElementIdx);
        leftList.removeAt(randElementIdx);
        element.color = Colors.red;
        redList.add(element);
        redElementInLeftColumn.add(false);
        rightList.add(element);
      } else {
        int randElementIdx = Random().nextInt(rightList.length - 1);
        MyList element = rightList.elementAt(randElementIdx);
        rightList.removeAt(randElementIdx);
        element.color = Colors.red;
        redList.add(element);
        redElementInLeftColumn.add(true);
        leftList.add(element);
      }
      if(redList.length==5){
        isFive=true;
      }

    });
  }
  buttonTwo() {
    setState(() {
      int randElementIdx = Random().nextInt(redList.length);
      MyList element = redList.elementAt(randElementIdx);
      print(element.title);
      bool elementInLeftColumn = redElementInLeftColumn.elementAt(randElementIdx);
      if (elementInLeftColumn) {
        redList.removeAt(randElementIdx);
        leftList.remove(element);
        element.color = Colors.grey;
        rightList.add(element);
      } else {
        redList.removeAt(randElementIdx);
        rightList.remove(element);
        element.color = Colors.grey;
        leftList.add(element);
      }
      if(redList.isEmpty){
        isFive=false;
      }
    });

  }

  Widget list(BuildContext context, List list) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
          children: list
              .map((side) => card(context, side.title, side.color))
              .toList()),
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
