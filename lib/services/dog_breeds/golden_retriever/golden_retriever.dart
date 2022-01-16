import 'package:flutter/material.dart';
import 'package:happy_paws/components/constants.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'golden_retriever_stats.dart';

class GoldenRetrieverDetails extends StatelessWidget {
  const GoldenRetrieverDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          iconTheme:IconThemeData(color:Colors.black87),
          title: Text('Breed Details',style:kBreedAppBarTextStyle),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body:ListView(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.network(GoldenRetriever.image,fit: BoxFit.cover,width:200),
                ),
                Container(width: 120,
                    child: Text('Golden Retriever',style: kBreedTitleStyle))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(GoldenRetriever.body,style:kBreedBodyStyle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('More Stats',style:kBreedHeadingStyle),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton(onPressed: (){
                    _launchURLGoldenRetriever();
                  }, child: Text('Learn More',style:kBreedButtonStyle)),
                )
              ],
            ),
            Container(
                height: 160,
                child: GoldenRetrieverStats()
            )
          ],
        )
    );
  }
}


_launchURLGoldenRetriever() async {
  const url =GoldenRetriever.page;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
