// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio/MobileWorkBox.dart';

class MobileWork extends StatefulWidget {
  const MobileWork({super.key});

  @override
  _MobileWorkState createState() => _MobileWorkState();
}

class _MobileWorkState extends State<MobileWork> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.3,
      ),
      child: Column(
        children: [
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
                        /*Center(
                          child: VerticalDivider(
                            color: Color(0xff64FFDA),
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),*/
                        Center(
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
                        ))
                      ],
                    )),
              ),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: size.height * 1.2,
                    child: const MobileWorkBox(),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
