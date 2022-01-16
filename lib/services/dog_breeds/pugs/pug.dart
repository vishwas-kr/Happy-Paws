import 'package:flutter/material.dart';
import 'package:happy_paws/components/constants.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:happy_paws/services/dog_breeds/pugs/pug_stats.dart';
import 'package:url_launcher/url_launcher.dart';

class PugDetails extends StatelessWidget {
  const PugDetails({Key? key}) : super(key: key);

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
                  child: Image.network(Pug.image,fit: BoxFit.cover,width:200),
                ),
                Text('Pug',style: kBreedTitleStyle)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(Pug.body,style:kBreedBodyStyle),
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
                    _launchURLPug();
                  }, child: Text('Learn More',style:kBreedButtonStyle)),
                )
              ],
            ),
            Container(
                height: 280,
                child: PugStats()
            )
          ],
        )
    );
  }
}


_launchURLPug() async {
  const url =Pug.page;
  if (await launch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
