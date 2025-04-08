import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsly_app/features/screens/auth/login.dart';
import 'package:newsly_app/services/auth.dart';
import 'package:newsly_app/shared/colors/appcolors.dart';
import 'package:newsly_app/shared/helper/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isPassword = false;
  register() async {
    try {
      final response = await AuthenticationMethod().signUpAuth(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text);
      return "success";
    } on FirebaseAuthException catch (error) {
      debugPrint('Error is : ${error.toString()}');
      return error.message;
    } catch (error) {
      print('Error : $error.toString()');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(
            top: 10,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.1),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Register Account',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: Image.asset("assets/images/news_login.png"),
                ),
                Gap(20),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Full Name',
                    fillColor: kWhiteColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(
                          12), // Rounded corners when focused
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                ),
                Gap(20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    fillColor: kWhiteColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(
                          12), // Rounded corners when focused
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                ),
                Gap(20),
                TextFormField(
                  obscureText:isPassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon:IconButton(
                      icon: Icon(isPassword?Icons.visibility_off_outlined:Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isPassword=!isPassword;
                        });
                      },
                    ),
                    prefixIcon: Icon(Icons.password_outlined),
                    labelText: 'Password',
                    fillColor: kWhiteColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(
                          12), // Rounded corners when focused
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                ),
                Gap(20),
                Builder(builder: (context) {
                  return Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kSecondryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () async {
                                try {
                                  final response = await register();
                                  if (response == "success") {
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Register Successfully")));
                                    }).then((value) {
                                      NavigateAndFinish(context, LoginScreen());
                                    });
                                  } else {
                                    AwesomeDialog(
                                      context: context,
                                      title: "Login Failed ....",
                                      desc: response,
                                      dialogType: DialogType.error,
                                    ).show();
                                  }
                                } catch (e) {
                                  AwesomeDialog(
                                    context: context,
                                    title: "Login Failed ....",
                                    desc: e.toString(),
                                    dialogType: DialogType.error,
                                  ).show();
                                }
                                NavigateAndFinish(context, LoginScreen());
                              },
                              child: Text(
                                'Register',
                                style:
                                    TextStyle(color: kWhiteColor, fontSize: 27),
                              ))),
                    ],
                  );
                }),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have you an account ?"),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }), (route) => false);
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(fontSize: 16, color: kPrimaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
