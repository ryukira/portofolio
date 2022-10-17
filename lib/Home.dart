import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'About.dart';
import 'AppBarTitle.dart';
import 'FutureProject.dart';
import 'Work.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
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
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
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
        physics: ScrollPhysics(),
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
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Spacer(),
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
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Me',
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    method.launchURL(
                                        "https://drive.google.com/file/d/1zjG-X1eE3rmAd5KnPZXVwkZAECB-g90W/view?usp=sharing");
                                  },
                                  child: AppBarTitle(
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
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://github.com/ryukira/ryukira");
                            }),
                        IconButton(
                            icon: const Icon(Icons.mail),
                            color: const Color(0xffffa8b2d1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: [
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 200),
                                      child: Text(
                                        "hallo ini aku Rully",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xffCCD6F6)
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
                                child: About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: Work()),
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
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
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
