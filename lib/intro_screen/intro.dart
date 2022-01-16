import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_paws/components/Strings.dart';
import 'package:happy_paws/intro_screen/ColorSys.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_paws/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  storeOnBoardInfo() async{
    int isViewed=0;
   SharedPreferences prefs= await SharedPreferences.getInstance();
   await prefs.setInt('Introduction', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: TextButton( onPressed:(){
              storeOnBoardInfo();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                  (route)=>false);
            },
              child:Text('Skip',
              style: TextStyle(
                  color: ColorSys.gray,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          )
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {

              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: 'images/intro/intro.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: 'images/intro/intro1.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              Container(
                padding: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 60.h,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: GestureDetector(onTap: (){
                            storeOnBoardInfo();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                                (route)=>false);
                          },
                            child: Image(
                                image: AssetImage('images/intro/intro2.png'),height: 200.h,),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Text(
                      Strings.stepThreeTitle,
                      style: TextStyle(
                          color: ColorSys.primary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                       Strings.stepThreeContent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorSys.gray,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      Strings.stepThreeQuote,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorSys.gray,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 60.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Image.asset(image,height: 200.h,),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
                color: ColorSys.primary,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorSys.gray,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6.h,
      width: isActive ? 30.w : 6.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
          color: ColorSys.secoundry, borderRadius: BorderRadius.circular(5.r)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
