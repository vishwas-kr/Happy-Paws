import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_paws/screens/main_screen.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.phone,
      required this.adddres,
      required this.email,
      required this.pname})
      : super(key: key);
  final String fname;
  final String lname;
  final String phone;
  final String adddres;
  final String email;
  final String pname;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

TextEditingController _firstNameController = TextEditingController();
TextEditingController _secondNameController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _petNameController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _emailController = TextEditingController();

final _editFormKey = GlobalKey<FormState>();

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    _firstNameController.text = widget.fname;
    _secondNameController.text = widget.lname;
    _addressController.text = widget.adddres;
    _petNameController.text = widget.pname;
    _phoneNumberController.text = widget.phone;
    _emailController.text = widget.email;

    super.initState();
  }

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
        .child('User Image')
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
            key: _editFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
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
                  "First Name",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
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
                    _firstNameController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Last Name",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _secondNameController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your last name');
                    }
                  },
                  onSaved: (value) {
                    _secondNameController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    enabled: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Contact No.",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _phoneNumberController,
                  textInputAction: TextInputAction.next,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your contact number');
                    }
                  },
                  onSaved: (value) {
                    _phoneNumberController.text = value!;
                  },
                ),
                SizedBox(height: 10.h),
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
                  "Address",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: _addressController,
                  textInputAction: TextInputAction.done,
                  //initialValue: _firstNameController.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('Enter your Address');
                    }
                  },
                  onSaved: (value) {
                    _addressController.text = value!;
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
                              .collection('users')
                              .doc(user!.uid);
                          await uploadImage();
                          if (_editFormKey.currentState!.validate()) {
                            docUser.update({
                              'firstName': _firstNameController.text,
                              'secondName': _secondNameController.text,
                              'mobileNumber': _phoneNumberController.text,
                              'address': _addressController.text,
                              'petName': _petNameController.text,
                              'image': _uploadedImageUrl,
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
