import 'package:flutter/material.dart';
import 'package:portofolio/WorkCustomData.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        WorkCustomData(
          title: "OnePlus Student Ambassador",
          subTitle: "OnePlus India",
          duration: "Sept,2021 - Present",
        ),
        WorkCustomData(
          title: "vGHC'21 Mentor",
          subTitle: "Project - CircuitVerse",
          duration: "Oct,2021",
        ),
        WorkCustomData(
          title: "Google Cloud Facilitator",
          subTitle: "Google Cloud India",
          duration: "Sept,2021 - Present",
        ),
        WorkCustomData(
          title: "Postman Student Expert",
          subTitle: "Postman",
          duration: "Aug,2021 - Present",
        ),
        WorkCustomData(
          title: "Founder - funccFORCE",
          subTitle: "A women centric community",
          duration: "Oct,2020 - Present",
        ),
      ],
    );
  }
}
