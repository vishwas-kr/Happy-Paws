import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/constants.dart';
import 'package:happy_paws/model/petModel.dart';

class DetailListView extends StatefulWidget {
  const DetailListView({Key? key, required this.petdata}) : super(key: key);
  static const iconsColor = Color(0xff7F8C8D);

  final PetModel petdata;

  @override
  State<DetailListView> createState() => _DetailListViewState();
}

class _DetailListViewState extends State<DetailListView> {
  @override
  Widget build(BuildContext context) {
    final titles = [
      'Breed',
      'Age',
      'Size',
      'Gender',
      'Netuered',
      'Physical Health',
      'Other Symptoms'
    ];
    // final data = [
    //   'Pineapple Freak',
    //   '3 Years',
    //   'Small',
    //   'Male',
    //   'Yes',
    //   'Good',
    //   'No'
    // ];
    final List data = [
      widget.petdata.petBreed,
      widget.petdata.petAge,
      widget.petdata.petSize,
      widget.petdata.petGender,
      widget.petdata.petNetured,
      widget.petdata.petHealth,
      widget.petdata.petSymptoms,
    ];

    final icons = [
      FontAwesomeIcons.paw,
      FontAwesomeIcons.arrowUp,
      FontAwesomeIcons.dog,
      FontAwesomeIcons.mars,
      FontAwesomeIcons.userTimes,
      FontAwesomeIcons.solidHeart,
      FontAwesomeIcons.heartbeat
    ];
    final iconColor = [
      DetailListView.iconsColor,
      DetailListView.iconsColor,
      DetailListView.iconsColor,
      DetailListView.iconsColor,
      DetailListView.iconsColor,
      DetailListView.iconsColor,
      DetailListView.iconsColor
    ];
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Card(
          //                            Card widget
          child: ListTile(
            leading: Icon(icons[index], color: iconColor[index]),
            title: Text(
              titles[index],
              style: kTextStyle,
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                data[index],
                style: kTextStyle2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        );
      },
    );
  }
}
