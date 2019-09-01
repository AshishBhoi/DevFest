import 'package:devfest_demo/config/config_bloc.dart';
import 'package:devfest_demo/universal/image_card.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {

  _lunchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lunch $url';
    }
  }

  List<Widget> devFestTexts(context) => [
        Text(
          DevFest.welcomeText,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          DevFest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
      ];

      Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _lunchURL("https://www.facebook.com/ashish.bhoi.2016");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _lunchURL("https://twitter.com/Ashishbhoi8");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                await _lunchURL("https://www.linkedin.com/in/ashish-k-b03914136/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _lunchURL("https://www.youtube.com/channel/UCqF1tnyK-B1eEBGewE1s8Cg?view_as=subscriber");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () async {
                await _lunchURL("https://www.instagram.com/ashishkumar_04/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl = '''mailto:noreply@abdevp.com?subject=Support Need For Developer Conference''';
                var out = Uri.encodeFull(emailUrl);
                await _lunchURL(out);
              },
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn
                  ? DevFest.banner_dark
                  : DevFest.banner_light,
            ),
            SizedBox(
              height: 20,
            ),
            ...devFestTexts(context),
            socialActions(context),
            SizedBox(height: 20,),
              Text(
                DevFest.app_version,
                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
              )
          ],
        ),
      ),
    );
  }
}