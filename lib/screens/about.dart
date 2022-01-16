import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff373f51),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('HAPPY PAWS Pet-Care',style: TextStyle(color: Colors.white,fontFamily: 'Shadows into light',fontSize: 24.0),),
            Text('Version 1.00.00.1',style: TextStyle(color: Colors.grey.shade300,fontFamily: 'Montserrat',fontSize: 18.0),),
            SizedBox(height: 10,),
            Image(image:AssetImage('images/intro/intro.png'),height:150),
            SizedBox(height: 10,),
            Text('© 2021 HappyPaws Inc.',style: TextStyle(color: Colors.grey.shade300,fontFamily: 'Sora',fontSize: 16),),
            SizedBox(height: 30,),
            Text('LICENSES',style: TextStyle(color: Colors.blueAccent,fontSize: 20,decoration: TextDecoration.underline),)
          ],
        ),
      ),
    );
  }
}
