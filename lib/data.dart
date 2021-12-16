import 'package:flutter/material.dart';
import 'dart:convert';

class MyList {
  String title;

  MyList(this.title);
}

getList(int number, String side) {
  var elements = [];
  for (int i = 0; i < number; i ++) {
    elements.add(MyList(side + " " + (i + 1).toString()));
  }
  return elements;
}