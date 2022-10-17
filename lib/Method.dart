// ignore_for_file: deprecated_member_use, file_names

import 'package:url_launcher/url_launcher.dart';

class Method {
  launchURL(String link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // launchCaller() async {
  //   const url = "tel:8887493655";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  launchEmail() async {
    if (await canLaunch("mailto:rullyriel@gmail.com")) {
      await launch("mailto:rullyriel@gmail.com");
    } else {
      throw 'Could not launch';
    }
  }
}
