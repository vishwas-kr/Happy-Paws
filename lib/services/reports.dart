import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_paws/services/service_components/report_details.dart';
import 'package:url_launcher/url_launcher.dart';

class Reports extends StatefulWidget {

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
          title:Text('Pet Report', style:TextStyle(fontFamily: 'Sora',
              color:Colors.black87)),
          iconTheme:IconThemeData(color:Colors.black87),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children:[ Container(
            padding: EdgeInsets.all(16..h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:160.h,
                  child:Row(
                    children: [
                      Container(width:160.w,
                          child: Image.network(PetProfile.profileImage,height:200.h,)),
                      Container(
                        margin: EdgeInsets.all(16.h),
                        child: Text('Bruno Mars',style:TextStyle(
                            fontSize: 22.sp, fontFamily: 'Montserrat',
                            fontWeight:FontWeight.w500,
                            color:Color(0xff2C3E50))),
                      )
                    ],
                  ),
                ),
               SizedBox(height: 10.h),
               Container(
                   height:330.h,child: DetailListView()
               ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      icon:Icon(FontAwesomeIcons.info, size: 14.0),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade200,
                        onPrimary: Colors.white,
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
                      icon:Icon(FontAwesomeIcons.phone, size: 14.0),
                      onPressed:(){_customLaunch('tel: 9876543210');},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent.shade200,
                        onPrimary: Colors.grey.shade100,
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
                      icon:Icon(FontAwesomeIcons.userMd, size: 16.0),
                      onPressed: () {_customLaunch('sms: 9876543210');},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade200,
                        onPrimary: Colors.grey.shade100,
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
  ]
        ),
    );
  }
}
