import 'package:chatting_app/View/Constants/app_assets.dart';
import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:chatting_app/View/Widgets/CustomButton.dart';
import 'package:chatting_app/View/Widgets/CustomTextFields.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final passfocusNode = FocusNode();
  bool enable = false;
  bool emailError = false;
  bool passError = false;
  String emailErrorText = '';
  String passErrorText = '';
  bool emailText1 = false;
  bool emailText2 = false;
  bool passText1 = false;
  bool passText2 = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        // 👇 Keyboard dismiss होते ही यह चलेगा
        print("Keyboard dismissed! Performing action...");
        performAction();
      }
    });
  }

  void performAction() {
    // यहां अपना कोड लिखें जो कीबोर्ड हटने के बाद चलेगा
    focusNode.unfocus();
    print("Action performed after keyboard disappears.");
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Unfocus the text field when back button is pressed
        print("fsf");
        if (focusNode.hasFocus) {
          focusNode.unfocus();
          return false; // Prevent default back button behavior
        }
        return true; // A
      },
      child: Scaffold(
        //  backgroundColor: Colors.transparent,
        // extendBody: true,
        //   extendBodyBehindAppBar: true,
        appBar: AppBar(
            //   backgroundColor: Color(0x44000000),
            // elevation: 0,
            // foregroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            // shadowColor: Colors.transparent,
            //   backgroundColor: Colors.transparent,
            leadingWidth: AppDimensions.width10(context) * 6,
            leading: Padding(
              padding:
                  EdgeInsets.only(left: AppDimensions.width10(context) * 2),
              child: CustomButton().backButton(context, onTap: () {
                Navigator.pop(context);
              }),
            )),
        body: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.only(
                left: AppDimensions.width10(context) * 2,
                right: AppDimensions.width10(context) * 2),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppDimensions.width10(context) * 4,
                    ),
                    SizedBox(
                      child: Text(
                        "Log in to Chatbox",
                        style: TextStyle(
                            fontFamily: 'Caros',
                            fontWeight: FontWeight.w700,
                            fontSize: AppDimensions.font10(context) * 2.5),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.width10(context) * 2,
                    ),
                    SizedBox(
                      width: AppDimensions.width10(context) * 34,
                      child: Text(
                        "Welcome back! Sign in using your social account or email to continue us",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0XFF797C7B),
                            fontFamily: 'Circular',
                            fontWeight: FontWeight.w500,
                            fontSize: AppDimensions.font10(context) * 1.8),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.width10(context) * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: SizedBox(
                            height: AppDimensions.width10(context) * 5,
                            child: Image.asset(AppAssets.whiteFacebook),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.width10(context) * 3,
                        ),
                        InkWell(
                          child: SizedBox(
                            height: AppDimensions.width10(context) * 5,
                            child: Image.asset(AppAssets.whiteGoogle),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.width10(context) * 3,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: const Color(0XFFCDD1D0),
                          thickness: 0.5,
                          endIndent: AppDimensions.width10(context) * 1.5,
                        )),
                        SizedBox(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: const Color(0XFF797C7B),
                                fontSize: AppDimensions.width10(context) * 1.8,
                                fontFamily: 'Circular'),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          color: const Color(0XFFCDD1D0),
                          thickness: 0.5,
                          indent: AppDimensions.width10(context) * 1.5,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.width10(context) * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: AppDimensions.width10(context) * 31),
                      child: Text(
                        //    textAlign: TextAlign.left,
                        "Your email",
                        style: TextStyle(
                            color: const Color(0xff24786D),
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontFamily: 'Circular'),
                      ),
                    ),
                    CustomTextField().textField(
                        controller: emailController,
                        enable: emailError,
                        focusNode: focusNode,
                        onChanged: (value) {
                          setState(() {
                            // if (value.isNotEmpty) {
                            //   emailError = false;
                            //   emailErrorText = '';
                            // }

                            if (EmailValidator.validate(value)) {
                              emailError = false;
                              emailErrorText = '';
                            }
                          });
                        },
                        validator: (value) {
                          setState(() {
                            if (value!.isEmpty) {
                              emailError = true;
                              emailText1 = true;
                              emailErrorText = 'Email is Empty';
                            } else if (!EmailValidator.validate(value)) {
                              emailError = true;
                              emailErrorText = 'Invalid email address';
                              print("raa ${emailText1}");
                            } else {
                              emailError = false;
                              emailErrorText = '';
                            }
                          });
                        }),
                    emailError == true
                        ? SizedBox(
                            height: AppDimensions.width10(context) * 1,
                          )
                        : const SizedBox(),
                    emailError == true
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: emailText1 == true
                                    ? AppDimensions.width10(context) * 30
                                    : AppDimensions.width10(context) * 26),
                            child: Text(
                              emailErrorText,
                              style: TextStyle(
                                  fontFamily: 'Circular',
                                  color: Colors.red,
                                  fontSize:
                                      AppDimensions.font10(context) * 1.4),
                            ),
                          )
                        : const SizedBox(),
                    emailError == true
                        ? SizedBox(
                            height: AppDimensions.width10(context) * 0.2,
                          )
                        : SizedBox(
                            height: AppDimensions.width10(context) * 3,
                          ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: AppDimensions.width10(context) * 31),
                      child: Text(
                        //    textAlign: TextAlign.left,
                        "Password",
                        style: TextStyle(
                            color: const Color(0xff24786D),
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontFamily: 'Circular'),
                      ),
                    ),
                    CustomTextField().textField(
                        controller: passwordController,
                        focusNode: passfocusNode,
                        enable: passError,
                        onChanged: (value) {
                          setState(() {
                            if (passwordController.text.isNotEmpty) {
                              enable = true;
                            } else {
                              enable = false;
                            }

                            if (value.length > 8) {
                              passError = false;
                              passErrorText = '';
                            }
                          });
                        },
                        validator: (value) {
                          setState(() {
                            if (value!.isEmpty) {
                              passError = true;
                              passText1 = true;
                              passErrorText = 'Password is Empty';
                            } else if (value.length < 8) {
                              passError = true;
                              passErrorText = 'Minimum 8 Characters';
                            } else {
                              passError = false;
                              passErrorText = '';
                            }
                          });
                        }),
                    passError == true
                        ? SizedBox(
                            height: AppDimensions.width10(context) * 1,
                          )
                        : const SizedBox(),
                    passError == true
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: passText1 == true
                                    ? AppDimensions.width10(context) * 27
                                    : AppDimensions.width10(context) * 24),
                            child: Text(
                              passErrorText,
                              style: TextStyle(
                                  fontFamily: 'Circular',
                                  color: Colors.red,
                                  fontSize:
                                      AppDimensions.font10(context) * 1.4),
                            ),
                          )
                        : const SizedBox(),
                    //  const Spacer(),
                    focusNode.hasFocus || passfocusNode.hasFocus
                        ? SizedBox(
                            height: AppDimensions.width10(context) * 5,
                          )
                        : SizedBox(
                            height: AppDimensions.width10(context) * 18,
                          ),
                    CustomButton().appButton(context,
                        onPressed: enable == true
                            ? () {
                                if (_formKey.currentState!.validate()) {}
                              }
                            : null,
                        buttonText: "Log in",
                        textColor:
                            enable == true ? Colors.white : Color(0XFF797C7B),
                        buttonBgColor: enable == true
                            ? const Color(0XFF24786D)
                            : const Color(0xffF3F6F6)),
                    SizedBox(
                      height: AppDimensions.width10(context) * 2,
                    ),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: const Color(0XFF24786D),
                          fontSize: AppDimensions.font10(context) * 1.8,
                          fontFamily: 'Circular',
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: AppDimensions.width10(context) * 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
