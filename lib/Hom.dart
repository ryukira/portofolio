// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/cupertino.dart';

import 'Home.dart';
import 'MobileHome.dart';

class Hom extends StatefulWidget {
  const Hom({super.key});

  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return const HomePage();
        } else {
          return const MobileHome();
        }
      },
    );
  }
}
