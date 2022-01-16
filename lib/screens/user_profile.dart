import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_paws/model/user_model.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

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
      // backgroundColor: Color(0xfffddb3a),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leadingWidth: 30,
        iconTheme:IconThemeData(color:Colors.black87),
        title: Text('User Profile', style:TextStyle(fontWeight:FontWeight.bold,fontFamily: 'Montserrat',color: Colors.black87),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_outlined))
        ],
      ),
      body: ListView(
        children: [
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Image(image: AssetImage('images/user/user8.png'),height: 300.h,),
              ])),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.blueGrey,),
                  // color: Colors.yellow.shade200,
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30.r)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${loggedInUser.firstName}\n${loggedInUser.secondName}',
                            style: TextStyle(
                                height: 1.h,
                                fontSize: 30.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800)),
                      ],
                    ),
                    SizedBox(height:20.h),
                    Divider(
                      thickness: 1.h,
                    ),
                    RichText(text: TextSpan(text:'Pet Name: ',style:TextStyle(fontSize:16.sp,color:Colors.black87,fontFamily: 'Sora'),children: [TextSpan(text:'${loggedInUser.petName}')])),
                    Divider(
                      thickness: 1.h,
                    ),
                    RichText(text: TextSpan(text:'Email: ',style:TextStyle(fontSize:16.sp,color:Colors.black87,fontFamily: 'Sora'),children: [TextSpan(text:'${loggedInUser.email}')])),
                    Divider(
                      thickness: 1.h,
                    ),
                    RichText(text: TextSpan(text:'Contact No: ',style:TextStyle(fontSize:16.sp,color:Colors.black87,fontFamily: 'Sora'),children: [TextSpan(text:'${loggedInUser.mobileNumber}')])),
                    Divider(
                      thickness: 1.h,
                    ),
                    RichText(text: TextSpan(text:'Address: ',style:TextStyle(fontSize:16.sp,color:Colors.black87,fontFamily: 'Sora'),children: [TextSpan(text:'${loggedInUser.address}')])),
                    Divider(
                      thickness: 1.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// © Vishwas Kumar