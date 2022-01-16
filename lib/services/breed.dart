import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_paws/services/dog_breeds/german_shepherd/german_shepherd.dart';
import 'package:happy_paws/services/dog_breeds/pomeranian/pomeranian.dart';
import 'package:happy_paws/services/dog_breeds/rottweiler/rottweiler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dog_breeds/beagle/beagle.dart';
import 'dog_breeds/chihuahua/chihuahua.dart';
import 'dog_breeds/golden_retriever/golden_retriever.dart';
import 'dog_breeds/pugs/pug.dart';
import 'dog_breeds/siberian_husky/siberian_husky.dart';

class Breed extends StatelessWidget {
  const Breed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text('Popular Dog Breeds',style:TextStyle(fontFamily: 'Sora',color: Colors.black87)),
        elevation: 0.0,
        iconTheme:IconThemeData(color:Colors.black87),
        backgroundColor: Colors.transparent,
      ),
      body:GridView.count(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.w),
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-detail.jpg?bust=1535565487&width=355",
                 fit: BoxFit.cover),
                onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>ChihuahuaDetails()));}
             ),
             ),
          Container(
            padding: EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/pomeranian-detail.jpg?bust=1535566323&width=355",
               fit: BoxFit.cover),
              onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>PomeranianDetails()));}
          ),),
          Container(
            padding: EdgeInsets.all(8.w),
           child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/golden-retriever-detail.jpg?bust=1535565857&width=355",
                fit: BoxFit.cover),
               onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>GoldenRetrieverDetails()));}
           ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/pug-detail.jpg?bust=1535566394&width=355",
                fit: BoxFit.cover),
                onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>PugDetails()));}
            ),
          ),
          Container(
            padding:EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/siberian-husky-detail.jpg?bust=1535566590&width=355",
                fit: BoxFit.cover),
                onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>SiberianHuskyDetails()));}
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/german-shepherd-dog-detail.jpg?bust=1535565817&width=355",
                fit: BoxFit.cover),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GermanShepherdDetails()));
            },),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/beagle-detail.jpg?bust=1535565158&width=355",
                fit: BoxFit.cover),
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>BeagleDetails()));}
            ),
          ),
          Container(
            padding:EdgeInsets.all(8.w),
            child:GestureDetector(child:Image.network("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/rottweiler-detail.jpg?bust=1535566466&width=355",
                fit: BoxFit.cover),
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>RotwelierDetails()));}
            ),
          ),
        ],
      )
    );
  }
}
