import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_paws/model/user_model.dart';
import 'package:happy_paws/screens/edit_profile.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'User Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: Colors.black87),
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfile(
                              fname: loggedInUser.firstName!,
                              lname: loggedInUser.secondName!,
                              email: loggedInUser.email!,
                              phone: loggedInUser.mobileNumber!,
                              pname: loggedInUser.petName!,
                              adddres: loggedInUser.address!,
                            )));
              },
              icon: Icon(Icons.filter_list_outlined))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
                height: 125.h,
                width: 125.w,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: loggedInUser.image == null
                      ? Image(
                          image: AssetImage('images/user/user8.png'),
                          height: 125.h,
                          width: 125.w,
                        )
                      : Image.network(
                          '${loggedInUser.image}',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                                child: const CircularProgressIndicator());
                          },
                        ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        '${loggedInUser.firstName} ${loggedInUser.secondName}',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${loggedInUser.email}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Divider(
                    indent: 50,
                    thickness: 1.h,
                    endIndent: 50,
                  ),
                  ProfileFields(
                    heading: "Name",
                    text:
                        '${loggedInUser.firstName} ${loggedInUser.secondName}',
                  ),
                  ProfileFields(
                    heading: "Email",
                    text: '${loggedInUser.email}',
                  ),
                  ProfileFields(
                    heading: "Contact No.",
                    text: '${loggedInUser.mobileNumber}',
                  ),
                  ProfileFields(
                    heading: "Pet Name",
                    text: '${loggedInUser.petName}',
                  ),
                  ProfileFields(
                    heading: "Address",
                    text: '${loggedInUser.address}',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileFields extends StatelessWidget {
  const ProfileFields({
    Key? key,
    required this.heading,
    required this.text,
  }) : super(key: key);

  final String heading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          heading,
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800),
        ),
        SizedBox(height: 5.h),
        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}


// © Vishwas Kumar