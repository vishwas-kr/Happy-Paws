import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_paws/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_paws/model/petModel.dart';
import 'package:happy_paws/model/user_model.dart';
import 'package:happy_paws/screens/login_screen.dart';
import 'package:happy_paws/screens/main_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final mobileNumberEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final petnameEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff1f3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Container(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: Column(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('images/girl.png'),
                      height: 150.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //White Container
              child: Container(
                decoration: kUpperLeftRightEdgeBoxDecoration,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, top: 15.h, bottom: 10.h),
                        child: Text('Sign-up',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                              color: Color(0xff223843),
                            )),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: firstNameEditingController,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            hintText: 'Enter First Name',
                            labelText: 'First Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: kFloatingLabel,
                            border: kTextFieldOutlined,
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{3,}$');
                            if (value!.isEmpty) {
                              return ("First Name cannot be Empty");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid name(Min. 3 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstNameEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: secondNameEditingController,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            hintText: 'Enter Second Name',
                            labelText: 'Second Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: kFloatingLabel,
                            border: kTextFieldOutlined,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Second Name cannot be Empty");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            secondNameEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                            controller: emailEditingController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Your Email',
                                labelText: 'Email',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: kFloatingLabel,
                                border: kTextFieldOutlined),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              // reg expression for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please Enter a valid email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailEditingController.text = value!;
                            }),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: mobileNumberEditingController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Your Contact Number',
                              labelText: 'Contact no.',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: kFloatingLabel,
                              border: kTextFieldOutlined),
                          validator: (value) {
                            if (value!.length > 10) return ("Enter a");

                            RegExp regex =
                                new RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
                            if (value.isEmpty) {
                              return ('Please Enter your Phone Number');
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Phone Number");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            mobileNumberEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: passwordEditingController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              hintText: 'Password',
                              labelText: 'Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: kFloatingLabel,
                              border: kTextFieldOutlined),
                          obscureText: true,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                          },
                          onSaved: (value) {
                            passwordEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: confirmPasswordEditingController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              hintText: 'Confirm Password',
                              labelText: 'Confirm Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: kFloatingLabel,
                              border: kTextFieldOutlined),
                          obscureText: true,
                          validator: (value) {
                            if (confirmPasswordEditingController.text !=
                                passwordEditingController.text) {
                              return "Password don't match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            confirmPasswordEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: petnameEditingController,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.dog),
                            hintText: 'Enter Pet Name',
                            labelText: 'Pet Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: kFloatingLabel,
                            border: kTextFieldOutlined,
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{3,}$');
                            if (value!.isEmpty) {
                              return ("Name cannot be Empty");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid name(Min. 3 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            petnameEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: kSignUpPadding,
                        child: TextFormField(
                          controller: addressEditingController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.addressCard),
                            hintText: 'Enter Your Address',
                            labelText: 'Address',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: kFloatingLabel,
                            border: kTextFieldOutlined,
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{5,}$');
                            if (value!.isEmpty) {
                              return ("Address cannot be Empty");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Address(Min. 5 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            addressEditingController.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10.h),
                        child: SizedBox(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(40),
                          child: ElevatedButton(
                            //Login Button
                            onPressed: () {
                              signUp(emailEditingController.text,
                                  passwordEditingController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff223843),
                              onPrimary: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: loading != false
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text('Submit',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Montserrat',
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    setState(() {
      loading = true;
    });
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              {postPetDetailsToFireStore(), postDetailsToFirestore()})
          .catchError((e) {
        setState(() {
          loading = false;
        });
        Fluttertoast.showToast(msg: e!.message);
      });
    }
    setState(() {
      loading = false;
    });
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.mobileNumber = mobileNumberEditingController.text;
    userModel.password = passwordEditingController.text;
    userModel.petName = petnameEditingController.text;
    userModel.address = addressEditingController.text;
    // userModel.image = "";

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
////////////////////////////////////////DEFAULT PET DETAILS///

  postPetDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    PetModel petModel = PetModel();

    petModel.uid = user!.uid;
    petModel.petName = petnameEditingController.text;
    petModel.petAge = "?";
    petModel.petGender = "?";
    petModel.petHealth = "?";
    //petModel.petImage = "?";
    petModel.petNetured = "?";
    petModel.petSymptoms = "?";
    petModel.petBreed = '?';
    petModel.petSize = "?";

    await firebaseFirestore
        .collection("petDetails")
        .doc(user.uid)
        .set(petModel.toMap());
  }
}
