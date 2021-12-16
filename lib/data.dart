import 'package:flutter/material.dart';
import 'dart:convert';

class MyList {
  String title;
  Color color;
  MyList(this.title, {this.color=Colors.grey});
}

getList(int number, String side) {
  var elements = [];
  for (int i = 0; i < number; i ++) {
    elements.add(MyList(side + " " + (i + 1).toString()));
  }
  return elements;
}

