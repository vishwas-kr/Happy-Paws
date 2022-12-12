import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_paws/model/user_model.dart';
//import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';

class Doc3 extends StatefulWidget {
  const Doc3({Key? key}) : super(key: key);

  @override
  _Doc3State createState() => _Doc3State();
}

class _Doc3State extends State<Doc3> {
  TimeOfDay _time = TimeOfDay.now();

  void _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: _time,
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            child: child!,
          );
        });
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  DateTime selectedDate = DateTime.now();

  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 30))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        helpText: 'Select booking date', // Can be used as title
        cancelText: 'Not now',
        confirmText: 'Book',
        fieldLabelText: 'Booking date',
        fieldHintText: 'Month/Date/Year',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter date in valid range',
        selectableDayPredicate: _decideWhichDayToEnable,
        builder: (context, child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            child: child!,
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // final Telephony telephony = Telephony.instance;
  // void _sendSMS(String number, String message) async {
  //   print(number);

  //   // Check if a device is capable of sending SMS
  //   bool? canSendSms = await telephony.isSmsCapable;
  //   print(canSendSms);

  //   telephony.sendSms(
  //     to: number, message: message,);
  // }

  _makeCALL() async {
    const url = 'tel:9876543211';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: ListView(children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Image(
                        image: AssetImage('images/doc/doc3.png'),
                        height: 200.h)),
                Divider(
                  thickness: 0.5.w,
                  color: Colors.black,
                  indent: 50.w,
                  endIndent: 50.w,
                ),
                Text('Doc. Sharmilee Pattnaik',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Shadows Into Light', fontSize: 22.sp)),
                Text(
                  'Specalist - Veternary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.blueGrey,
                      fontSize: 16.sp),
                ),
                Text(
                  'Medical University,Cornell',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Sora', color: Colors.blueGrey),
                ),
                Divider(
                  thickness: 0.5.w,
                  color: Colors.black,
                  indent: 50.w,
                  endIndent: 50.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 14.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _makeCALL,
                          child: Container(
                            padding: EdgeInsets.all(8.h),
                            width: 70.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.red.shade100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.phoneAlt,
                                ),
                                SizedBox(height: 5.h),
                                Text('Call Now',
                                    style: TextStyle(
                                        fontFamily: 'Shadows Into Light',
                                        fontSize: 16.sp))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          width: 70.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.brown.shade100),
                          child: Column(children: [
                            Icon(FontAwesomeIcons.addressCard),
                            SizedBox(height: 5.h),
                            Text('Address',
                                style: TextStyle(
                                    fontFamily: 'Shadows Into Light',
                                    fontSize: 16.sp))
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          width: 70.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.green.shade100),
                          child: Column(children: [
                            Text('9+',
                                style: TextStyle(
                                    fontSize: 18.sp, fontFamily: 'montserrat')),
                            SizedBox(height: 5.h),
                            Text('Years',
                                style: TextStyle(
                                    fontFamily: 'Shadows Into Light',
                                    fontSize: 16.sp))
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          width: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.blue.shade100),
                          child: Column(children: [
                            Icon(FontAwesomeIcons.file),
                            SizedBox(height: 5.h),
                            Text('Reviews',
                                style: TextStyle(
                                    fontFamily: 'Shadows Into Light',
                                    fontSize: 16.sp))
                          ]),
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Schedule\nAppointment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: Colors.black87,
                          ),
                          label: Text(
                            ' Date',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Sora'),
                          ),
                          onPressed: () => _selectDate(context),
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(FontAwesomeIcons.clock,
                              color: Colors.black87),
                          label: Text(
                            'Time',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Sora'),
                          ),
                          onPressed: () => _selectTime(context),
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 10.h),
                    height: 100.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('About',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.h),
                        Text(
                            'Dr. Sharmilee Pattnaik is a highly qualified and experienced veterinarian from Chicago. She ia a specialist in taking care of pets.',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.blueGrey)),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Card(
                    elevation: 2.0,
                    color: Color(0xfffefeff),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Container(
                        padding: EdgeInsets.all(16.w),
                        height: 130.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Appointment Selected:',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "Date: ",
                                    children: [
                                      TextSpan(
                                        text: "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'sora'),
                                      )
                                    ],
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sora'))),
                            RichText(
                                text: TextSpan(
                                    text: "Time: ",
                                    children: [
                                      TextSpan(
                                        text: '${_time.format(context)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'sora'),
                                      )
                                    ],
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sora'))),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fees: \$30',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.blue,
                                      )),
                                  ElevatedButton(
                                    onPressed: () {
                                      var date = "${selectedDate.toLocal()}"
                                          .split(' ')[0];
                                      var time = '${_time.format(context)}';
                                      // _sendSMS("${loggedInUser.mobileNumber}", " Hello Happy Paws User. Your Appointment has been scheduled successfully.\nDate: $date \nTime: $time  \n \nThank You. ");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      primary: Color(0xff5CB9C2),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
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
                                ]),
                          ],
                        )),
                  ),
                )
              ],
            )),
      ]),
    );
  }
}
