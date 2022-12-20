import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main_screen.dart';
import 'sign_up_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEFF1F3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                //Upper Part
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                    child: Center(
                      child: Image(
                        height: 200.h,
                        image: AssetImage('images/intro/intro.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //White Container
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, top: 10.h),
                            child: Text('Log-In',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff223843),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 10.h),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.r)),
                                ),
                                prefixIcon: Icon(Icons.email),
                                hintText: 'User ID',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Please Enter Your Email');
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please Enter a valid email");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 10.h),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.r)),
                                ),
                                prefixIcon: Icon(Icons.vpn_key),
                                hintText: 'Password',
                              ),
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
                                passwordController.text = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 10.h, right: 10.w),
                            child: SizedBox(
                              width: 400.w,
                              height: 40.h,
                              child: ElevatedButton(
                                //Login Button
                                onPressed: () {
                                  signIn(emailController.text,
                                      passwordController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff223843),
                                  onPrimary: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: loading != false
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text('Login',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'Montserrat',
                                        )),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                //Sign-Up Button
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  'Sign-up',
                                  style: TextStyle(
                                    color: Color(0xff223843),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height:MediaQuery.of(context).size.height /5,
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'from HAPPY PAWS',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.blueGrey,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
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

  void signIn(String email, String password) async {
    setState(() {
      loading = true;
    });
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainScreen())),
              })
          .catchError((e) {
        setState(() {
          loading = false;
        });
        Fluttertoast.showToast(msg: e.message);
      });
    }
    setState(() {
      loading = false;
    });
  }
}
