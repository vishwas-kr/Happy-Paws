import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens/main_screen.dart';

class EditPetProfile extends StatefulWidget {
  const EditPetProfile(
      {Key? key,
      required this.pName,
      required this.pBreed,
      required this.pAge,
      required this.pSize,
      required this.pGender,
      required this.pNetured,
      required this.pHealth,
      required this.pSymptoms})
      : super(key: key);
  final String pName;
  final String pBreed;
  final String pAge;
  final String pSize;
  final String pGender;
  final String pNetured;
  final String pHealth;
  final String pSymptoms;

  @override
  State<EditPetProfile> createState() => _EditPetProfileState();
}

TextEditingController _petNameController = TextEditingController();
TextEditingController _breedController = TextEditingController();
TextEditingController _ageController = TextEditingController();
TextEditingController _sizeController = TextEditingController();
TextEditingController _genderController = TextEditingController();
TextEditingController _neturedController = TextEditingController();
TextEditingController _healthController = TextEditingController();
TextEditingController _oSymptomsController = TextEditingController();

final _editPetProfileKey = GlobalKey<FormState>();

class _EditPetProfileState extends State<EditPetProfile> {
  XFile? _file;
  String _uploadedImageUrl = '';
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    try {
      var _selectedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _file = _selectedFile;
      });
      if (_file?.path == null) {
        return Fluttertoast.showToast(msg: 'Image Not Selected');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  uploadImage() async {
    if (_file?.path == null) {
      return Fluttertoast.showToast(msg: 'Image Not Selected');
    }
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('Pet Images')
        .child(DateTime.now().millisecondsSinceEpoch.toString());

    try {
      await ref.putFile(File(_file!.path));
      var _uploadedImage = await ref.getDownloadURL();
      setState(() {
        _uploadedImageUrl = _uploadedImage;
        print(_uploadedImage);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void initState() {
    _petNameController.text = widget.pName;
    _breedController.text = widget.pBreed;
    _ageController.text = widget.pAge;
    _sizeController.text = widget.pSize;
    _genderController.text = widget.pGender;
    _neturedController.text = widget.pNetured;
    _healthController.text = widget.pHealth;
    _oSymptomsController.text = widget.pSymptoms;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Edit User Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: Colors.black87),
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _editPetProfileKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 125.h,
                    width: 125.h,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: InkWell(
                      onTap: (() => pickImage()),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: _file?.path == null
                              ? Container(
                                  height: 125.h,
                                  width: 125.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey)),
                                  child: Icon(Icons.camera_alt_outlined))
                              : Image.file(
                                  File(_file!.path),
                                  fit: BoxFit.cover,
                                )),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  "Pet Name",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _petNameController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,

                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your pet name');
                    }
                  },
                  onSaved: (value) {
                    _petNameController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Pet Breead",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _breedController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter pet breead');
                    }
                  },
                  onSaved: (value) {
                    _breedController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Pet Age",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _ageController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter pet age');
                    }
                  },
                  onSaved: (value) {
                    _ageController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Pet Size",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _sizeController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your pet size');
                    }
                  },
                  onSaved: (value) {
                    _sizeController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Enter Gender",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _genderController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter Gender');
                    }
                  },
                  onSaved: (value) {
                    _genderController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Pet Netured",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _neturedController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your first name');
                    }
                  },
                  onSaved: (value) {
                    _neturedController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Pet Health",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _healthController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your first name');
                    }
                  },
                  onSaved: (value) {
                    _healthController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Pet Symptoms",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _oSymptomsController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your first name');
                    }
                  },
                  onSaved: (value) {
                    _oSymptomsController.text = value!;
                  },
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 45,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () async {
                        try {
                          setState(() {
                            loading = true;
                          });
                          User? user = _auth.currentUser;
                          final docUser = FirebaseFirestore.instance
                              .collection('petDetails')
                              .doc(user!.uid);
                          await uploadImage();
                          if (_editPetProfileKey.currentState!.validate()) {
                            docUser.update({
                              'petAge': _ageController.text,
                              'petBreed': _breedController.text,
                              'petGender': _genderController.text,
                              'petHealth': _healthController.text,
                              'petImage': _uploadedImageUrl,
                              'petName': _petNameController.text,
                              'petNetured': _neturedController.text,
                              'petSize': _sizeController.text,
                              'petSymptoms': _oSymptomsController.text
                            }).then((value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                                (route) => false));
                            Fluttertoast.showToast(msg: 'Profile Updated');
                          }
                          setState(() {
                            loading = false;
                          });
                        } catch (e) {
                          setState(() {
                            loading = false;
                          });
                          Fluttertoast.showToast(msg: e.toString());
                        }
                      },
                      child: loading != false
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Save",
                              style: TextStyle(fontSize: 16),
                            )),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
