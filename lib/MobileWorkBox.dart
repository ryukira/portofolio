// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portofolio/WorkCustomData.dart';

class MobileWorkBox extends StatelessWidget {
  const MobileWorkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        WorkCustomData(
          title: "Flutter Developer - Bank Raya",
          subTitle: "FrontEnd",
          duration: "Present",
        ),
      ],
    );
  }
}
