import 'package:flutter/material.dart';
import 'package:happy_paws/components/constants.dart';
import 'package:happy_paws/components/scroll_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        leadingWidth: 30,
        title: Text('Available Doctors',
            style: TextStyle(fontFamily: 'Sora', color: Colors.black87)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: Column(
              children: [
                Center(
                  child: Image(
                    height: MediaQuery.of(context).size.height * .350,
                    image: AssetImage('images/group.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: kUpperLeftRightEdgeBoxDecoration,
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(), child: ScrollCard()),
          ))
        ],
      ),
    );
  }
}
