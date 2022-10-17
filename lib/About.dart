// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portofolio/CustomText.dart';

class About extends StatelessWidget {
  const About({super.key});

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: const Color(0xffCCD6F6).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //ABOUT ME
          SizedBox(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //TITLE ABOUT ME
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "About Me",
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
                Wrap(
                  children: const [
                    CustomText(
                      text:
                          "Hello! I'm Rully, currently living in Jakarta. I enjoy building things and learn new technology.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      text:
                          "Currently, I am pursuing my postgraduate, as well as building projects on a daily basis.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      text:
                          "Here are a few technologies, I've been working with recently:\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.75,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "Firebase"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.15,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "C/C++, Java."),
                            technology(context, "HTML & CSS"),
                            technology(context, "Git - Github"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Profile Image
          Expanded(
            child: SizedBox(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.10,
                    left: size.width * 0.100,
                    child: Card(
                      color: Colors.black12,
                      child: Container(
                        margin: const EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: const Color(0xFF6181B8),
                      ),
                    ),
                  ),
                  const CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  const CustomImageAnimation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Colors.black12.withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;

  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Colors.black12.withOpacity(0.5);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: Colors.black54,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage("images/profile.jpg"),
            ),
          ),
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
