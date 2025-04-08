import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsly_app/features/screens/auth/register.dart';
import 'package:newsly_app/features/screens/home/home_screen.dart';
import 'package:newsly_app/services/auth.dart';
import 'package:newsly_app/shared/colors/appcolors.dart';
import 'package:newsly_app/shared/helper/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPassword = false;
  Future<String?> login() async {
    try {
      final user = await AuthenticationMethod().signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      return "success";
    } on FirebaseAuthException catch (error) {
      debugPrint('Error is : ${error.toString()}');
      return error.message;
    } catch (e) {
      return e.toString();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
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
                    child: Text('Login Account',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    child: Image.asset("assets/images/news_login.png"),
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
                      suffixIcon: IconButton(
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
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              final response = await login();
                              if (response == "success") {
                                Future.delayed(const Duration(seconds: 2), () {
                                  isLoading = true;
                                }).then((value) {
                                  NavigateAndFinish(context, HomeScreen());
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
                          }
                        },
                        child: isLoading == false
                            ? Text(
                                'Login',
                                style:
                                    TextStyle(color: kWhiteColor, fontSize: 28),
                              )
                            : CircularProgressIndicator(),
                      ))
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?"),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }), (route) => false);
                        },
                        child: Text(
                          'Register Now',
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
      ),
    );
  }
}
