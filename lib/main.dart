// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'Hom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rully Boriel',
      home: Hom(),
      debugShowCheckedModeBanner: false,
    );
  }
}
