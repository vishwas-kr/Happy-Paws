import 'package:flutter/material.dart';
import 'package:happy_paws/doctors/doc1.dart';
import 'package:happy_paws/doctors/doc2.dart';
import 'package:happy_paws/doctors/doc3.dart';
import 'package:happy_paws/doctors/doc4.dart';
import 'package:happy_paws/doctors/doc5.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 150.h,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 3,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user/user1.png'),
                        backgroundColor: Color(0xff70A5D7),
                        radius: 40.r,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Prof. Dr. Rahul Chadda',
                        style: TextStyle(
                            color: Color(0xff1F2F4C),
                            fontSize: 18.sp,
                            fontFamily: 'Sora'),
                      ),
                      Text('Senior Veterinary Surgeon',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900)),
                      Text(
                        '🕙  10:00 AM - 2:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff979FAF),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$30',
                                style: TextStyle(
                                    color: Colors.blue.shade600,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 60.w,
                            ),
                            ElevatedButton(
                              //Login Button
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doc1()));
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                primary: Color(0xff72CCD4),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              child: Text(
                                'Appointment',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 3,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user/user4.png'),
                        backgroundColor: Color(0xffF9B895),
                        radius: 40.r,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dr. Thomas Grey',
                        style: TextStyle(
                            color: Color(0xff1F2F4C),
                            fontSize: 18.sp,
                            fontFamily: 'Sora'),
                      ),
                      Text('Animal Welfare Chicago',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900)),
                      Text(
                        '🕑  1:00 PM - 3:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff979FAF),
                        ),
                      ),
                      Row(children: [
                        Text('\$25',
                            style: TextStyle(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 60.w,
                        ),
                        ElevatedButton(
                          //Login Button
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Doc2()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            primary: Color(0xff72CCD4),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            'Appointment',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 3,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user/user6.png'),
                        backgroundColor: Color(0xff72CCD4),
                        radius: 40,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dr. Shamo',
                        style: TextStyle(
                            color: Color(0xff1F2F4C),
                            fontSize: 18.sp,
                            fontFamily: 'Sora'),
                      ),
                      Text('Specalist - Veternary',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900)),
                      Text(
                        '🕑  12:00 PM - 3:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff979FAF),
                        ),
                      ),
                      Row(children: [
                        Text('\$35',
                            style: TextStyle(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 60.w,
                        ),
                        ElevatedButton(
                          //Login Button
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Doc3()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            primary: Color(0xff72CCD4),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            'Appointment',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 3,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user/user3.png'),
                        backgroundColor: Color(0xff70A5D7),
                        radius: 40,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dr. Harpreet',
                        style: TextStyle(
                            color: Color(0xff1F2F4C),
                            fontSize: 18.sp,
                            fontFamily: 'Sora'),
                      ),
                      Text('Veterinary Surgon & Welfare ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900)),
                      Text(
                        '🕑  1:00 PM - 5:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff979FAF),
                        ),
                      ),
                      Row(children: [
                        Text('\$30',
                            style: TextStyle(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 60.w,
                        ),
                        ElevatedButton(
                          //Login Button
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Doc4()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            primary: Color(0xff72CCD4),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            'Appointment',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 3,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user/user2.png'),
                        backgroundColor: Color(0xffF9B895),
                        radius: 40,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dr. RJ Khan',
                        style: TextStyle(
                            color: Color(0xff1F2F4C),
                            fontSize: 18.sp,
                            fontFamily: 'Sora'),
                      ),
                      Text('Exotic Animal Veterinary',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900)),
                      Text(
                        '🕑  3:00 PM - 5:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff979FAF),
                        ),
                      ),
                      Row(children: [
                        Text('\$20',
                            style: TextStyle(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 60.sp,
                        ),
                        ElevatedButton(
                          //Login Button
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Doc5()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            primary: Color(0xff72CCD4),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            'Appointment',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
