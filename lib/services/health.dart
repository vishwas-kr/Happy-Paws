import 'package:flutter/material.dart';
import 'package:happy_paws/services/service_components/health_article_details.dart';
import 'package:happy_paws/services/service_components/health_grooming_details.dart';
import 'package:happy_paws/services/service_components/health_training_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthServices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       backgroundColor:Colors.grey.shade100,
        appBar: AppBar(
          leadingWidth: 30,
          title: Text('Dogs: Health/Grooming/Training',style: TextStyle(fontFamily: 'Sora',fontSize: 16.sp,color: Colors.black87)),
          iconTheme:IconThemeData(color: Colors.black87),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Article'),
              Tab(text: 'Grooming'),
              Tab(text: 'Training')
            ],
            indicatorColor: Colors.green.shade200,
            indicatorWeight: 3.0,
            labelColor: Color(0xff000000),
            labelStyle: TextStyle(fontFamily: 'Sora',
                fontSize: 22.sp),
            unselectedLabelColor: Colors.blueGrey,
            unselectedLabelStyle: TextStyle(
                fontFamily: 'Montserrat', fontSize: 16.sp),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: TabBarView( children:[
                    buildListViewArticle(),
                  buildListViewGrooming(),
                  buildListViewTraining(),
                  ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
