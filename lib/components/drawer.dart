import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/map.dart';
import 'package:happy_paws/screens/about.dart';
import 'package:happy_paws/screens/doctor_list.dart';
import 'package:happy_paws/screens/login_screen.dart';
import 'package:happy_paws/screens/pet_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideDrawer extends StatelessWidget {
  static const iconColor = Color(0xff223843);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff223843)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: AssetImage('images/Girlpet.png'),
                    height: 80.h,
                  ),
                  Text(
                    'Happy Paws',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Sora',
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: iconColor),
              title: Text('Home',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w500)),
              minLeadingWidth: 10,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.pets,
                color: iconColor,
              ),
              title: Text('Pet Details',
                  style: TextStyle(fontSize: 18.sp, fontFamily: 'Sora')),
              minLeadingWidth: 10,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PetDetails()));
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services, color: iconColor),
              title: Text('Doctor List',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w500)),
              minLeadingWidth: 10,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoctorList()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: iconColor),
              title: Text('Nearby Store',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w500)),
              minLeadingWidth: 10,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopMaps()));
              },
            ),
            Divider(height: 30.0, color: Colors.blueGrey),
            ListTile(
              leading: Icon(FontAwesomeIcons.signOutAlt, color: iconColor),
              title: Text('Log-out',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w500)),
              minLeadingWidth: 10,
              onTap: () {
                logout(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: iconColor),
              title: Text('About',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w500)),
              minLeadingWidth: 10,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
