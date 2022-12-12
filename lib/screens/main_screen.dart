import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_paws/components/drawer.dart';
import 'package:happy_paws/components/constants.dart';
import 'package:happy_paws/components/scroll_card.dart';
import 'package:happy_paws/model/user_model.dart';
import 'package:happy_paws/screens/doctor_list.dart';
import 'package:happy_paws/screens/user_profile.dart';
import 'package:happy_paws/services/dean.dart';
import 'package:happy_paws/services/health.dart';
import 'package:happy_paws/services/breed.dart';
import 'package:happy_paws/services/reports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff223843)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/user/user8.png'),
                backgroundColor: Color(0xfffddb3a),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                ),
              ),
            )
          ]),
      drawer: SideDrawer(),
      body: Container(
        padding: EdgeInsets.only(left: 15.w, top: 5.h, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${loggedInUser.firstName}',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Text('Find your specialist',
                  style: TextStyle(
                      color: Color(0xff182B4B),
                      fontSize: 20.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w700)),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: kTextFieldOutlined,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20.h,
                          ),
                          hintText: 'Search Doctor'),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.pets,
                    size: 24.h,
                    color: Color(0xff72CCD4),
                  ),
                )
              ],
            ),
            Container(
              height: 170.h,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthServices()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.w),
                        height: 130.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          color: Color(0xff70A5D7),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: kBoxShadow1,
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10.h,
                                    left: 20.w,
                                    right: 20.w,
                                    bottom: 5.h),
                                alignment: Alignment.center,
                                child: Image(
                                    image: AssetImage('images/health.png'),
                                    height: 80.h)),
                            Text('Health',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Breed()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.w),
                        height: 130.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Color(0xff72CCD4),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: kBoxShadow2,
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10.h,
                                    left: 20.w,
                                    right: 20.w,
                                    bottom: 5.h),
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage('images/breed.png'),
                                  height: 80.h,
                                )),
                            Text('Breed',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Reports()));
                      },
                      child: Container(
                        height: 130.h,
                        width: 100.w,
                        margin: EdgeInsets.only(right: 16.w),
                        decoration: BoxDecoration(
                            color: Color(0xffF9B895),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: kBoxShadow3),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10.h,
                                    left: 20.w,
                                    right: 20.w,
                                    bottom: 5.h),
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage('images/report.png'),
                                  height: 80.h,
                                )),
                            Text('Reports',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dean()));
                      },
                      child: Container(
                        height: 130.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Color(0xffBAFA7A),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: kBoxShadow4),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10.h,
                                    left: 20.w,
                                    right: 20.w,
                                    bottom: 5.h),
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage('images/dean.png'),
                                  height: 80.h,
                                )),
                            Text('Dean',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Doctor',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorList()));
                      },
                      child: Text('See all',
                          style: TextStyle(
                            fontSize: 14.sp,
                          )))
                ],
              ),
            ),
            Expanded(
              child: ScrollCard(),
            ),
          ],
        ),
      ),
    );
  }
}
