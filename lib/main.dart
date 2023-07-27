import 'package:flutter/material.dart';
import 'package:portofolio/desktop/d_about_me.dart';
import 'package:portofolio/desktop/d_contact.dart';
import 'package:portofolio/desktop/d_education.dart';
import 'package:portofolio/desktop/d_experience.dart';
import 'package:portofolio/desktop/d_footer.dart';
import 'package:portofolio/desktop/d_technotes.dart';
import 'package:portofolio/desktop/d_volunteering.dart';
import 'package:portofolio/theme/app_theme.dart';
import 'package:portofolio/theme/responsive_screen_provider.dart';
import 'package:portofolio/widgets/nav_bar.dart';

import 'desktop/d_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruli Ripaldi',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBackToTopButon = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButon = true;
              } else {
                _showBackToTopButon = false;
              }
            },
          );
        },
      );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DHeader(),
          DAboutMe(),
          DEducation(),
          DExperience(),
          DVolunteering(),
          DTechNotes(),
          DContact(),
          DFooter(),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DHeader(),
          DAboutMe(),
          DEducation(),
          DExperience(),
          DVolunteering(),
          DTechNotes(),
          DContact(),
          DFooter(),
        ],
      );
    }

    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : AppBar(elevation: 0.0),
      drawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : NavBar().mobileNavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppThemeData.backgroundGrey,
          child: ResponsiveScreenProvider.isDesktopScreen(context)
              ? desktopUI()
              : mobileUI(),
        ),
      ),
      floatingActionButton: _showBackToTopButon == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Go to top',
              backgroundColor: AppThemeData.buttonPrimary,
              foregroundColor: AppThemeData.iconSecondary,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
    );
  }
}
