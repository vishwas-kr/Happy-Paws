import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/constants.dart';

class DetailListView extends StatelessWidget {
  static const iconsColor=Color(0xff7F8C8D);

  @override
  Widget build(BuildContext context) {


    final titles = ['Breed', 'Age', 'Size', 'Gender', 'Netuered', 'Physical Health',
    'Other Symptoms'];
    final data=['Pineapple Freak', '3 Years','Small','Male', 'Yes', 'Good', 'No'];
    final icons=[FontAwesomeIcons.paw, FontAwesomeIcons.arrowUp, FontAwesomeIcons.dog,FontAwesomeIcons.mars,
    FontAwesomeIcons.userTimes,FontAwesomeIcons.solidHeart,FontAwesomeIcons.heartbeat];
    final iconColor=[iconsColor,iconsColor,iconsColor,iconsColor,iconsColor,iconsColor,iconsColor];
    return  ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card( //                            Card widget
          child: ListTile(
            leading: Icon(icons[index],color:iconColor[index]),
            title: Text(titles[index],style: kTextStyle,),
            trailing: Padding(
              padding: EdgeInsets.only(right:10.0),
              child: Text(data[index],style:kTextStyle2,textAlign: TextAlign.start,),
            ),
          ),
        );
      },
    );
  }
}

