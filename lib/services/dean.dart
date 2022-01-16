import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Dean extends StatelessWidget {
  const Dean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _sendingSMS() async {
      const url = 'sms:9876543210';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }



    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(color:Colors.black87),
        elevation: 0.0,
        leadingWidth: 30,
        backgroundColor: Colors.transparent,
        title: Text('Dean Doc',style:TextStyle(fontFamily:'Sora', fontSize: 24.0,color: Colors.black87)),
      ),
      body:Container(
        padding:EdgeInsets.all(16.h),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              alignment: Alignment.center,
              child:Image(image:AssetImage('images/doc/headDoc.png'),height: 200.h)
            ),
            Divider(
              thickness:0.5.w,
              color: Colors.black,
              indent: 50.w,
              endIndent: 50.w,
            ),
            Text('Prof. Sharmilee Patnik',style: TextStyle(fontFamily: 'Shadows Into Light',fontSize:22.sp)),
            Text('Senior Veterinary Dermatologist',style: TextStyle(fontFamily: 'Sora',color:Colors.blueGrey,fontSize: 16.sp),),
            Text('Experiecne: 22+ Years',style: TextStyle(fontFamily: 'Sora',color: Colors.blueGrey),),
            Divider(
              thickness:0.5.w,
              color: Colors.black,
              indent: 50.w,
              endIndent: 50.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    GestureDetector(
                      onTap: _sendingSMS,
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.red.shade100
                        ),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.sms),
                            SizedBox(height:5.h),
                            Text('Message',style:TextStyle(fontFamily:'Shadows Into Light',fontSize: 16.sp))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.h),
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.green.shade100
                      ),
                      child: Column(
                          children:[
                            Icon(FontAwesomeIcons.addressCard),
                            SizedBox(height:5.h),
                            Text('Address',style: TextStyle(fontFamily:'Shadows Into Light',fontSize: 16.sp))
                          ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.h),
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.yellow.shade100
                      ),
                      child: Column(
                          children:[
                            Icon(FontAwesomeIcons.users),
                            SizedBox(height:5.h),
                            Text('Session',style:TextStyle(fontFamily: 'Shadows Into Light',fontSize: 18.sp))
                          ]
                      ),
                    )
                  ]
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *0.22,
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('About',style: TextStyle(fontFamily: 'Sora',fontSize: 16.sp)),
                        SizedBox(height:5.h),
                        Text('Prof. Sharmilee Patnik is a highly qualified veterinarian having experience of over 22+ years.',style: TextStyle(fontFamily: 'Montserrat',color:Colors.blueGrey)),
                        SizedBox(height:5.h),
                        Text('Bachelor of Veterinary Science (BVSc), Utrecht University.',style:TextStyle(fontFamily: 'Montserrat',color:Colors.blueGrey)),
                        SizedBox(height:5.h),
                        Text('Doctor of Veterinary Medicine (DVM), University of California.',style:TextStyle(fontFamily: 'Montserrat',color:Colors.blueGrey)),
                        SizedBox(height:10.h),
                        Text('Know More',style:TextStyle(fontFamily: 'Montserrat',color:Colors.blueAccent))
                      ],
                    )
                  ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
