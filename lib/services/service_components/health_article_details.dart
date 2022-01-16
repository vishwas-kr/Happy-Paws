import 'package:flutter/material.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:happy_paws/components/Strings.dart';
import 'package:happy_paws/components/constants.dart';

ListView buildListViewArticle() {
  return ListView(
    children: [
      Card(
        child: ExpansionTile(
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          leading: Image(image:NetworkImage(ArticleIcons.food),height: 50.0),
          title: Text(UnderStandingPetFood.title, style: kTitileStyle),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(UnderStandingPetFood.subTitile, style: kSubTitleStyle),
          ),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(UnderStandingPetFood.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(ArticleIcons.age),height: 50.0),
          textColor: Colors.black87,
          collapsedTextColor:Colors.grey,
          title: Text(AgeRelatedHealth.title, style: kTitileStyle),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(AgeRelatedHealth.subTitle, style: kSubTitleStyle),
          ),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(AgeRelatedHealth.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(ArticleIcons.spaying),height: 50.0),
          title: Text(SpayingAndNeutering.title, style: kTitileStyle),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(SpayingAndNeutering.subTitle, style: kSubTitleStyle),
          ),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(SpayingAndNeutering.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(ArticleIcons.healthConditions),height: 50.0),
          title: Text(AngelPets.title, style: kTitileStyle),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(AngelPets.subTitle, style: kSubTitleStyle),
          ),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(AngelPets.body,style:kBodyStyle),
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
          leading: Image(image:NetworkImage(ArticleIcons.boneCancer),height: 50.0),
          title: Text(BoneCancer.title, style: kTitileStyle),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(BoneCancer.subTitle, style: kSubTitleStyle),
          ),
          expandedAlignment: Alignment(-1, 2),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
          children: [
            Text(BoneCancer.body,style:kBodyStyle),
            TextButton(
                onPressed: () async {
                  _launchURL5();
                },
                child: Text('Learn More'))
          ],
        ),
      ),
    ],
  );
}

_launchURL() async {
  const url =PetFinder.foodUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url =PetFinder.ageUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url =PetFinder.spayingUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url =PetFinder.healthUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url =PetFinder.boneCancerUrl;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
