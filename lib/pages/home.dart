import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'dart:math';

import '../data.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    var leftList = getList(random.nextInt(6) + 5, "Left");
    var rightList = getList(random.nextInt(6) + 5, "Right");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              // list(context, leftList),
              // list(context, rightList)
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget list(BuildContext context, dynamic list) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children:  list.map((side) => card(context, side.title)).toList();
      ),
    );
  }

  Widget card(BuildContext context, dynamic title) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(title));
  }

}