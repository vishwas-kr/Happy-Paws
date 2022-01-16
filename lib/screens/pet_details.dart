import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/url_links.dart';
import 'package:happy_paws/model/user_model.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({Key? key}) : super(key: key);

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {

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
      appBar:AppBar(
        leadingWidth: 30,
        iconTheme:IconThemeData(color:Colors.black87),
        backgroundColor: Colors.transparent,
        elevation:0.0,
        title: Text('Pet Details',style:TextStyle(fontFamily: 'Sora',color: Colors.black87)),
      ),
      body:Container(
        padding: EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
            SizedBox(height: 20.0),
            ClipOval(child:Image.network(PetProfile.profileImage,height:200)),
            SizedBox(height: 20.0),
            Text('${loggedInUser.petName}',textAlign: TextAlign.center,style:TextStyle(fontFamily: 'Montserrat',fontSize: 24.0),),
            Text('pet of ${loggedInUser.firstName} ${loggedInUser.secondName}',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sora',color: Colors.blueGrey)),
            Text('Age: 5 Years',textAlign: TextAlign.center,style:TextStyle(fontFamily: 'sora',color: Colors.blueGrey)),
            SizedBox(height:30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red.shade100
                    ),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.heartbeat),
                        SizedBox(height:5.0),
                        Text('Health',style:TextStyle(fontFamily:'Shadows Into Light',fontSize: 20.0))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green.shade100
                    ),
                    child: Column(
                      children:[
                        Icon(FontAwesomeIcons.addressCard),
                        SizedBox(height:5.0),
                        Text('Address',style: TextStyle(fontFamily:'Shadows Into Light',fontSize: 20.0))
                      ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.yellow.shade100
                    ),
                    child: Column(
                      children:[
                        Icon(FontAwesomeIcons.bone),
                        SizedBox(height:5.0),
                        Text('Food',style:TextStyle(fontFamily: 'Shadows Into Light',fontSize: 20.0))
                      ]
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Text('Gallery',style: TextStyle(fontFamily: 'Montserrat',fontSize: 24.0)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                  children: [
                    Image.network(PetProfile.gallaryImage1),
                    SizedBox(width: 5.0),
                    Image.network(PetProfile.gallaryImage2),
                    SizedBox(width: 5.0),
                    Image.network(PetProfile.galleryImage3),
                    SizedBox(width: 5.0),
                    Image.network(PetProfile.galleryImage4)
                  ],
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


// © Vishwas Kumar