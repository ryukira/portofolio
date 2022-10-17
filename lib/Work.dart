// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio/CustomText.dart';

import 'WorkBox.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: "Experience",
                textsize: 26.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
                letterSpacing: 0,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                width: size.width / 4,
                height: 1.10,
                color: const Color(0xff303C55),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                    height: size.height * 1.2,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        const Center(
                            /*child: VerticalDivider(
                            color: Color(0xff303C55),
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),*/
                            ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              CircleAvatar(
                                backgroundColor: Color(0xffCCD6F6),
                                child: FaIcon(FontAwesomeIcons.crown,
                                    color: Colors.black),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xffCCD6F6),
                                child: FaIcon(FontAwesomeIcons.crown,
                                    color: Colors.black),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xffCCD6F6),
                                child: FaIcon(FontAwesomeIcons.crown,
                                    color: Colors.black),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xffCCD6F6),
                                child: FaIcon(FontAwesomeIcons.crown,
                                    color: Colors.black),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xffCCD6F6),
                                child: FaIcon(FontAwesomeIcons.blogger,
                                    color: Colors.black),
                              ),
                            ],
                          )),
                        )
                      ],
                    )),
              ),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: size.height * 1.2,
                    child: const WorkBox(),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
