import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
final kBoxShadow1=<BoxShadow>[
  BoxShadow(
      color: Color(0xff72CCD4),
      blurRadius: 10.r,
      offset: Offset(2.0, 5.0)
  )
];

final kBoxShadow2=<BoxShadow>[
  BoxShadow(
      color: Color(0xff72CCD4),
      blurRadius: 10.r,
      offset: Offset(2.0, 5.0)
  )
];
final kBoxShadow3=<BoxShadow>[
  BoxShadow(
      color:Color(0xffF9B895),
      blurRadius: 10.r,
      offset: Offset(2.0, 5.0)
  )
];
const kBoxShadow4=<BoxShadow>[
  BoxShadow(
      color:Color(0xffDEFA89),
      blurRadius: 10.0,
      offset: Offset(2.0, 5.0)
  )
];


//Login Screen Components
const kTextFieldOutlined=OutlineInputBorder(
  borderRadius:
  BorderRadius.all(Radius.circular(30.0)),
);
//Login Screen Padding
const kLoginPadding=EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0);


// Login & SignUp Screen Similar Components
final kUpperLeftRightEdgeBoxDecoration=BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.r),
    topRight: Radius.circular(30.r),
  ),
);


//Heading Text
final kHeadingTextStyle=TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 24.sp,
  fontWeight: FontWeight.w600,
  color: Color(0xff223843),
);


//Signup Screen Components
final kFloatingLabel=TextStyle(
  fontSize: 16.sp,
  color: Color(0xff223843),
);

final kSignUpPadding=EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w);



//Report Section
const kTextStyle=TextStyle(
    fontSize: 16.0, fontFamily: 'Montserrat',
    fontWeight:FontWeight.w900,
    color:Color(0xff34495e));

const kTextStyle2=TextStyle(
    fontSize: 16.0, fontFamily: 'Montserrat',
    fontWeight:FontWeight.w300,
    color:Color(0xff34495e));

const kPadding=EdgeInsets.symmetric(horizontal: 20.0, vertical:10);

const kDivider=Divider(height:1, color:Colors.grey);

// Health Detials

const kTitileStyle=TextStyle(fontSize: 16.0,fontWeight:FontWeight.bold,
    fontFamily:'Montserrat');

const kSubTitleStyle=TextStyle(fontSize: 16,fontFamily: 'Montserrat',);

const kBodyStyle=TextStyle(fontSize: 16,fontFamily: 'Montserrat',);


//Breed Grid Images
const kBreedBodyStyle=TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 16.0);
const kBreedHeadingStyle=TextStyle(fontSize: 24.0, color:Colors.purple);
const kBreedButtonStyle=TextStyle(color:Colors.blue,fontFamily: 'Sora');
const kBreedTitleStyle=TextStyle(fontFamily: 'Sora', fontSize: 20.0);
const kBreedAppBarTextStyle=TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Colors.black87);




