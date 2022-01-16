import 'package:flutter/material.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:happy_paws/components/Strings.dart';
import 'package:happy_paws/components/constants.dart';

ListView buildListViewGrooming() {
  return ListView(
    children: [
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(GroomingIcons.dogNails),height: 50.0),
          title: Text(DogNails.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(DogNails.body,style:kBodyStyle),
            TextButton(
              onPressed: () async {
                _launchURL();
              },
              child: Text('Learn More'),
            )
          ],
        ),
      ),
      Card(
        child: ExpansionTile(
          leading: Image(image:NetworkImage(GroomingIcons.dogTear),height: 50.0),
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          title: Text(DogTear.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(DogTear.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL2();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(GroomingIcons.homedental),height: 50.0),
          title: Text(HomeDentalCare.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(HomeDentalCare.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL3();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(GroomingIcons.analCare),height: 50.0),
          title: Text(Analcare.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(Analcare.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL4();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(GroomingIcons.dogBath),height: 50.0),
          title: Text(DogHatesBath.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(DogHatesBath.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL5();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(GroomingIcons.dogDental),height: 50.0),
          title: Text(DogDentalCare.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(DogDentalCare.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL6();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(GroomingIcons.groomer),height: 50.0),
          title: Text(FindGrommer.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(FindGrommer.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL7();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
    ],
  );
}

_launchURL() async {
  const url =PetFinder.dogNailsUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url =PetFinder.dogTearUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url =PetFinder.homeDentalCareUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url =PetFinder.analCareUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url =PetFinder.dogHatesBathUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL6() async {
  const url = PetFinder.dogDentalCareUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL7() async {
  const url = PetFinder.findGroomerUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
