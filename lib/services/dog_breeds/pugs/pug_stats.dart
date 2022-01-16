import 'package:flutter/material.dart';
import 'package:happy_paws/components/constants.dart';

class PugStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = ['Energy Level', 'Play Fulness', 'Friendliness To Dogs', 'Friendliness To Strangers', 'Ease Of Training', 'Heat Sensitivity','Exercise Requiremnets','Affection Level','Friendliness To Other Pets', 'Watchfulness', 'Grooming Requirements', 'Vocality'];
    final data=['⭐⭐⭐⭐', '⭐⭐⭐⭐','⭐⭐⭐','⭐⭐', '⭐⭐⭐', '⭐⭐⭐⭐⭐', '⭐⭐','⭐⭐⭐⭐','⭐⭐⭐','⭐','⭐⭐','⭐⭐⭐⭐⭐'];
    return  ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          title: Text(titles[index],style: kTextStyle,),
          trailing: Padding(
            padding: EdgeInsets.only(right:10.0),
            child: Text(data[index],style:kTextStyle2,textAlign: TextAlign.start,),
          ),
        );
      },
    );
  }
}

