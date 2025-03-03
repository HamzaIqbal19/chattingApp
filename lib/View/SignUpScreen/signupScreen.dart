import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:chatting_app/View/Widgets/CustomButton.dart';
import 'package:chatting_app/View/Widgets/CustomTextFields.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnfrmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final passfocusNode = FocusNode();
  bool enable = false;

  bool nameText = false;
  bool emailText = false;
  bool passText = false;
  bool cnfrmPassText = false;

  bool nameError = false;
  bool emailError = false;
  bool passError = false;
  bool cnfrmPassError = false;

  String nameErrorText = '';
  String emailErrorText = '';
  String passErrorText = '';
  String cnfrmPassErrorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: AppDimensions.height10(context) * 6,
        leading: Padding(
            padding: EdgeInsets.only(left: AppDimensions.height10(context) * 2),
            child: CustomButton().backButton(context, onTap: () {
              Navigator.pop(context);
            })),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(
              left: AppDimensions.width10(context) * 2,
              right: AppDimensions.width10(context) * 2),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimensions.width10(context) * 4,
                  ),
                  SizedBox(
                    child: Text(
                      "Sign up with Email",
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
                      "Get chatting with friends and family today by signing up for our chat app!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0XFF797C7B),
                          fontFamily: 'Circular',
                          fontWeight: FontWeight.w500,
                          fontSize: AppDimensions.font10(context) * 1.8),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.width10(context) * 6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: AppDimensions.width10(context) * 31),
                    child: Text(
                      //    textAlign: TextAlign.left,
                      "Your name",
                      style: TextStyle(
                          color: const Color(0xff24786D),
                          fontSize: AppDimensions.font10(context) * 1.7,
                          fontFamily: 'Circular'),
                    ),
                  ),
                  CustomTextField().textField(
                      controller: nameController,
                      enable: nameError,
                      onChanged: (value) {
                        setState(() {
                          // if (value.isNotEmpty) {
                          //   emailError = false;
                          //   emailErrorText = '';
                          // }

                          // if (EmailValidator.validate(value)) {
                          //   emailError = false;
                          //   emailErrorText = '';
                          // }
                        });
                      },
                      validator: (value) {
                        setState(() {
                          if (value!.isEmpty) {
                            nameError = true;
                            nameText = true;
                            nameErrorText = 'Name is Empty';
                          } else if (value.length <= 5) {
                            nameError = true;
                            nameErrorText = 'Name can' 't be less then 5';
                            print("raa ${emailText}");
                          } else {
                            nameError = false;
                            nameErrorText = '';
                          }
                        });
                      }),
                  nameError == true
                      ? SizedBox(
                          height: AppDimensions.width10(context) * 1,
                        )
                      : const SizedBox(),
                  nameError == true
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: nameError == true
                                  ? AppDimensions.width10(context) * 30
                                  : AppDimensions.width10(context) * 26),
                          child: Text(
                            emailErrorText,
                            style: TextStyle(
                                fontFamily: 'Circular',
                                color: Colors.red,
                                fontSize: AppDimensions.font10(context) * 1.4),
                          ),
                        )
                      : const SizedBox(),
                  nameError == true
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
                            emailText = true;
                            emailErrorText = 'Email is Empty';
                          } else if (!EmailValidator.validate(value)) {
                            emailError = true;
                            emailErrorText = 'Invalid email address';
                            print("raa ${emailText}");
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
                              left: emailText == true
                                  ? AppDimensions.width10(context) * 30
                                  : AppDimensions.width10(context) * 26),
                          child: Text(
                            emailErrorText,
                            style: TextStyle(
                                fontFamily: 'Circular',
                                color: Colors.red,
                                fontSize: AppDimensions.font10(context) * 1.4),
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
                      enable: passError,
                      onChanged: (value) {
                        setState(() {
                          // if (passwordController.text.isNotEmpty) {
                          //   enable = true;
                          // } else {
                          //   enable = false;
                          // }

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
                            passText = true;
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
                              left: passText == true
                                  ? AppDimensions.width10(context) * 27
                                  : AppDimensions.width10(context) * 24),
                          child: Text(
                            passErrorText,
                            style: TextStyle(
                                fontFamily: 'Circular',
                                color: Colors.red,
                                fontSize: AppDimensions.font10(context) * 1.4),
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
                        right: AppDimensions.width10(context) * 25),
                    child: Text(
                      //    textAlign: TextAlign.left,
                      "Confirm Password",
                      style: TextStyle(
                          color: const Color(0xff24786D),
                          fontSize: AppDimensions.font10(context) * 1.7,
                          fontFamily: 'Circular'),
                    ),
                  ),
                  CustomTextField().textField(
                      controller: cnfrmPasswordController,
                      enable: passError,
                      onChanged: (value) {
                        setState(() {
                          if (cnfrmPasswordController.text.isNotEmpty) {
                            enable = true;
                          } else {
                            enable = false;
                          }

                          if (value.length > 8) {
                            cnfrmPassError = false;
                            cnfrmPassErrorText = '';
                          }
                        });
                      },
                      validator: (value) {
                        setState(() {
                          if (value!.isEmpty) {
                            cnfrmPassError = true;
                            cnfrmPassText = true;
                            cnfrmPassErrorText = 'Password is Empty';
                          } else if (value.length < 8) {
                            cnfrmPassError = true;
                            cnfrmPassErrorText = 'Minimum 8 Characters';
                          } else {
                            cnfrmPassError = false;
                            cnfrmPassErrorText = '';
                          }
                        });
                      }),
                  cnfrmPassError == true
                      ? SizedBox(
                          height: AppDimensions.width10(context) * 1,
                        )
                      : const SizedBox(),
                  cnfrmPassError == true
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: passText == true
                                  ? AppDimensions.width10(context) * 27
                                  : AppDimensions.width10(context) * 24),
                          child: Text(
                            passErrorText,
                            style: TextStyle(
                                fontFamily: 'Circular',
                                color: Colors.red,
                                fontSize: AppDimensions.font10(context) * 1.4),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: AppDimensions.width10(context) * 12,
                  ),
                  CustomButton().appButton(context,
                      onPressed: enable == true
                          ? () {
                              if (_formKey.currentState!.validate()) {}
                            }
                          : null,
                      buttonText: "Create an account",
                      textColor:
                          enable == true ? Colors.white : Color(0XFF797C7B),
                      buttonBgColor: enable == true
                          ? const Color(0XFF24786D)
                          : const Color(0xffF3F6F6)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
