import 'package:url_launcher/url_launcher.dart';

//Actual Function to launch external links.
launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}