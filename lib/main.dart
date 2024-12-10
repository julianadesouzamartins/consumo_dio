import 'package:consumo_dio/home_page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/homePage1',
    routes: {
      '/homePage1': (context) => HomePage1(),
    },
  ));
}