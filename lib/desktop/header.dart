import 'package:flutter/material.dart';
import 'package:portofolio/theme/app_theme.dart';
import 'package:portofolio/widgets/nav_bar.dart';
import 'package:portofolio/widgets/social_profiles.dart';

import '../statics/data_values.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  List<Widget> headerData() {
    return [
      Image.asset(
        'assets/images/logo.png',
        height: 250.0,
        width: 250.0,
      ),
      const SizedBox(
        width: 60.0,
      ),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: AppThemeData.darkTheme.textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displayMedium,
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          const SocialProfiles(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeData.backgroundBlack,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, bottom: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: headerData(),
            ),
            const SizedBox(height: 60.0),
            NavBar().desktopNavBar(),
          ],
        ),
      ),
    );
  }
}
