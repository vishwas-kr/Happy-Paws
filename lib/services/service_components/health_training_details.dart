import 'package:flutter/material.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:happy_paws/components/Strings.dart';
import 'package:happy_paws/components/constants.dart';

ListView buildListViewTraining() {
  return ListView(
    children: [
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(TrainingIcons.tricks),height: 50.0),
          title: Text(Tricks.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(Tricks.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(TrainingIcons.senseDisaster),height: 50.0),
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          title: Text(SenseDisasters.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(SenseDisasters.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(TrainingIcons.intelligent),height: 50.0),
          title: Text(Intelligent.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(Intelligent.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(TrainingIcons.dogLanguage),height: 50.0),
          title: Text(Doglangauge.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(Doglangauge.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(TrainingIcons.feelsLove),height: 50.0),
          title: Text(DogsFeelLove.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(DogsFeelLove.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(TrainingIcons.potty),height: 50.0),
          title: Text(PottyTips.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(PottyTips.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(TrainingIcons.dogTrain),height: 50.0),
          title: Text(DogTrain.title, style: kTitileStyle),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(DogTrain.body,style:kBodyStyle),
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
  const url =PetFinder.tricksUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url =PetFinder.senseDisasterUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url =PetFinder.intelligentSpeciesUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url =PetFinder.dogLanguageUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url =PetFinder.feelLoveUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL6() async {
  const url = PetFinder.pottyTrainUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL7() async {
  const url = PetFinder.dogTrainUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
