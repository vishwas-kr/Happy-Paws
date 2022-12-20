import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_paws/data/firebase_data.dart';
import 'package:happy_paws/model/petModel.dart';
import 'package:happy_paws/services/service_components/edit_report.dart';
import 'package:happy_paws/services/service_components/report_details.dart';
import 'package:url_launcher/url_launcher.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key, required this.uid}) : super(key: key);
  final String uid;
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    void _customLaunch(data) async {
      if (await canLaunch(data)) {
        await launch(data);
      } else {
        print(' could not launch $data');
      }
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text('Pet Report',
            style: TextStyle(fontFamily: 'Sora', color: Colors.black87)),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.grey.shade200,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: FirebaseData().getPetData(widget.uid),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              PetModel petModel = snapshot.data as PetModel;
              return ListView(children: [
                Container(
                  padding: EdgeInsets.all(16..h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160.h,
                        child: Row(
                          children: [
                            Container(
                                width: 160.w,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: petModel.petImage == null
                                    ? Image.asset('images/pet.png')
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(90),
                                        child: Image.network(
                                          '${petModel.petImage}',
                                          height: 200.h,
                                          width: 200.w,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                                child:
                                                    const CircularProgressIndicator());
                                          },
                                        ),
                                      )),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(16.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${petModel.petName} ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff2C3E50)),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditPetProfile(
                                                        pAge:
                                                            '${petModel.petAge}',
                                                        pBreed:
                                                            '${petModel.petBreed}',
                                                        pGender:
                                                            '${petModel.petGender}',
                                                        pHealth:
                                                            '${petModel.petHealth}',
                                                        pName:
                                                            '${petModel.petName}',
                                                        pNetured:
                                                            '${petModel.petNetured}',
                                                        pSize:
                                                            '${petModel.petSize}',
                                                        pSymptoms:
                                                            '${petModel.petSymptoms}',
                                                      )));
                                        },
                                        child: Text(
                                          "Edit",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                          height: 330.h,
                          child: DetailListView(
                            petdata: petModel,
                          )),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(FontAwesomeIcons.info, size: 14.0),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            label: Text('More Info',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                )),
                          ),
                          ElevatedButton.icon(
                            icon: Icon(FontAwesomeIcons.phone, size: 14.0),
                            onPressed: () {
                              _customLaunch('tel: 9876543210');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            label: Text('Help',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                )),
                          ),
                          ElevatedButton.icon(
                            icon: Icon(FontAwesomeIcons.userMd, size: 16.0),
                            onPressed: () {
                              _customLaunch('sms: 9876543210');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            label: Text('Vertinary',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
