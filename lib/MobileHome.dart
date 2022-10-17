// ignore_for_file: sort_child_properties_last, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio/CustomText.dart';
import 'package:portofolio/Method.dart';
import 'package:portofolio/MobileProject.dart';
import 'package:portofolio/MobileWork.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.arrow_forward_ios,
          color: const Color(0xffCCD6F6).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
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
    Method method = Method();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
          elevation: 6.0,
          child: Column(
            children: const [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  accountName: Text("Sakshi Saxena"),
                  accountEmail: Text("sakshisaxena0808@gmail.com")),
              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("About"),
              ),
              Expanded(
                child: Text("Version 1.0.1"),
              )
            ],
          )),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              title: const Text(''),
              elevation: 0.0,
              backgroundColor: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        preferredSize: const Size(
          double.infinity,
          56.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff780206), Color(0xff061161)],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    child: Image.asset(
                      "images/sakshi.jpeg",
                      width: 150,
                      height: 150,
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Rully Boriel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w900,
                    fontSize: 52,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "I'm a final year engineering student who loves to explore new horizons including open-source contribution and wishes to create an impact and encourage the community.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xffCCD6F6).withOpacity(0.6),
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                /*SizedBox(
                  height: size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Wrap(
                    children: [
                      Text(
                        "Engineering student at Banasthali Vidyapith",
                        style: TextStyle(
                          color: Color(0xffCCD6F6),
                          fontSize: 15.0,
                          letterSpacing: 2.75,
                          wordSpacing: 0.75,
                        ),
                      )
                    ],
                  ),
                ),*/
                SizedBox(
                  height: size.height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.github,
                        color: Color(0xffa8b2d1),
                        size: 18.0,
                      ),
                      onPressed: () {
                        method.launchURL("https://github.com/ryukiraa");
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.linkedin,
                        color: Color(0xffa8b2d1),
                        size: 18.0,
                      ),
                      onPressed: () {
                        method.launchURL(
                            "https://www.linkedin.com/rully_boriel/");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),

                //About me
                FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: size.width,
                    //color: Colors.purple,
                    child: Column(
                      children: [
                        //About me title
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
                              width: MediaQuery.of(context).size.width * 0.01,
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

                        //About me desc
                        Wrap(
                          children: const [
                            CustomText(
                              text:
                                  "Hello! I'm Sakshi, currently living in Lucknow. I enjoy building things and learn new technology.\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                            CustomText(
                              text:
                                  "Currently, I am pursuing my Bachelor's degree in Electronics & Communication at Banasthali Vidyapith, as well as building projects on a daily basis.\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                            CustomText(
                              text:
                                  "Here are a few technologies I've been working with recently:\n\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.06,
                        ),

                        Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  technology(context, "Dart"),
                                  technology(context, "Flutter"),
                                  technology(context, "Firebase"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  technology(context, "C/C++"),
                                  technology(context, "HTML, & CSS"),
                                  technology(context, "Java"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.08,
                ),

                //Image
                /*Center(
                  child: Container(
                    height: size.height * 0.6,
                    width: size.width * 0.7,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50,
                          right: 20,
                          left: 50.0,
                          child: Card(
                            color: Color(0xFF6181B8),
                            child: Container(
                              margin: EdgeInsets.all(2.75),
                              height: size.height * 0.45,
                              width: size.width * 0.66,
                              color: Color(0xff0A192F),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.5,
                          width: size.width * 0.6,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/sakshi.jpeg"),
                          ),
                        ),
                        Container(
                          height: size.height * 0.5,
                          width: size.width * 0.6,
                          color: Color(0xFF6181B8).withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),*/

                //Where I've Worked title
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
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 4,
                      height: 1.10,
                      color: const Color(0xff303C55),
                    ),
                  ],
                ),

                const MobileWork(),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //Some Things I've Built title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "What I've build",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
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

                MobileProject(
                  ontab: () {},
                  image: "images/pic4.jpg",
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                MobileProject(
                  ontab: () {},
                  image: "images/pic5.jpg",
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                MobileProject(
                  ontab: () {},
                  image: "images/pic6.jpg",
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    //height: size.aspectRatio,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 16.0,
                        ),
                        const CustomText(
                          text: "Get In Touch",
                          textsize: 42.0,
                          color: Colors.white,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              "Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                letterSpacing: 0.75,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Card(
                          elevation: 4.0,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(0.85),
                            height: size.height * 0.10,
                            width: size.width * 0.30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff83a0e0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                "Say Hello",
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.github,
                        color: Color(0xffa8b2d1),
                        size: 15.0,
                      ),
                      onPressed: () {
                        method.launchURL("https://github.com/ryukiraa");
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.linkedin,
                        color: Color(0xffA8B2D1),
                        size: 15.0,
                      ),
                      onPressed: () {
                        method
                            .launchURL("https://www.linkedin.com/rully_boriel");
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.twitter,
                        color: Color(0xffa8b2d1),
                        size: 15.0,
                      ),
                      onPressed: () {
                        method.launchURL("https://twitter.com/rully_boriel");
                      },
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                      color: const Color(0xffA8B2D1),
                      onPressed: () {
                        method.launchURL(
                            "https://www.instagram.com/rully_boriel");
                      },
                      iconSize: 15.0,
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      color: const Color(0xffA8B2D1),
                      onPressed: () {
                        method.launchURL(
                            "https://www.facebook.com/sakshi.saxena.370/");
                      },
                      iconSize: 15.0,
                    ),
                    IconButton(
                        icon: const Icon(Icons.mail),
                        color: const Color(0xffA8B2D1),
                        iconSize: 16.0,
                        onPressed: () {
                          method.launchEmail();
                        }),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //Footer
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.white,
                  child: Text(
                    "Designed & Built by Sakshi Saxena",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      letterSpacing: 1.75,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
