// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'About.dart';
import 'AppBarTitle.dart';
import 'CustomText.dart';
import 'FutureProject.dart';
import 'Method.dart';
import 'Work.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      // ignore: avoid_print
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    // ignore: avoid_print
                    print('setState is called');
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        primary: true,
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff780206), Color(0xff061161)],
          )),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 5,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                const Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                const Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                const Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                const Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Me',
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    method.launchURL(
                                        "https://drive.google.com/file/d/1zjG-X1eE3rmAd5KnPZXVwkZAECB-g90W/view?usp=sharing");
                                  },
                                  child: const AppBarTitle(
                                    text: 'Resume',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github),
                            color: const Color(0xffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://github.com/ryukira/ryukira");
                            }),
                        IconButton(
                            icon: const Icon(Icons.mail),
                            color: const Color(0xffa8b2d1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.08,
                                        ),
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(80)),
                                          child: Image.asset(
                                            "image/profile.jpg",
                                            width: 150,
                                            height: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        const Text(
                                          "Rully Boriel",
                                          style: TextStyle(
                                            color: Color(0xffCCD6F6),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 68,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 200),
                                          child: Text(
                                            "hallo ini aku Rully",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xffCCD6F6)
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 12,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.20,
                                        ),
                                      ],
                                    ),
                                  ),

                                  //About Me
                                  _wrapScrollTag(
                                    index: 0,
                                    child: const About(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),

                                  //Where I've Worked
                                  _wrapScrollTag(index: 1, child: const Work()),
                                  SizedBox(
                                    height: size.height * 0.10,
                                  ),
                                  _wrapScrollTag(
                                      index: 2,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text("What I've build",
                                                  style: TextStyle(
                                                    fontSize: 26.0,
                                                    color: Color(0xffCCD6F6),
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              const SizedBox(
                                                width: 26.0,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                height: 0.75,
                                                color: const Color(0xff303C55),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          FeatureProject(
                                            imagePath: "images/profile.jpg",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://github.com/ryukiraa/");
                                            },
                                            projectDesc: "",
                                            projectTitle: "",
                                            tech1: "Flutter",
                                            tech2: "Dart",
                                            tech3: "Flutter UI",
                                          ),
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 6.0,
                                  ),

                                  _wrapScrollTag(
                                    index: 3,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.68,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          // color: Colors.orange,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const CustomText(
                                                text: "Get In Touch",
                                                textsize: 42.0,
                                                color: Colors.white,
                                                letterSpacing: 3.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              Wrap(
                                                children: [
                                                  Text(
                                                    "Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      letterSpacing: 0.75,
                                                      fontSize: 17.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 32.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  method.launchEmail();
                                                },
                                                child: Card(
                                                  elevation: 4.0,
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            0.85),
                                                    height: size.height * 0.09,
                                                    width: size.width * 0.10,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff83a0e0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                      ),
                                                      child: Text(
                                                        "Say Hello",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          //color: Colors.white,
                                          child: Text(
                                            "Designed & Built by Rully Boriel",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "rullyriel@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
