import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/commons/common.button.dart';
import 'package:short_video_app/commons/common.textfield.dart';
import 'package:short_video_app/controller/auth.controller.dart';
import 'dart:math' as math;

import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';
import 'package:short_video_app/presentation/auth/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authController = Get.put(AuthController());
  /* register form key */
  GlobalKey<FormState> registerKey =
      GlobalKey<FormState>(debugLabel: math.Random().nextInt(10).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: registerKey,
          child: ListView(
            children: [
              /* title*/
              title,
              /* sub title */
              subTitle,
              /* second title */
              secondTitle,

              /* email */
              emailField,
              /* passowrd */
              passwordField,
              /* confirm password field */
              confirmPasswordField,
              termCondition,
              /* register button */
              registerButton,
              // termCondition,
             /* login option */
             loginOption
            ],
          ),
        ),
      ),
    );
  }

  // login title
  Widget get title => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text('Register  Yourself',
            style: TextStyle(
                fontFamily: Fonts.regular,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.white)),
      );

  // login subtitle
  Widget get subTitle => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('Please fill below details to register',
            style: TextStyle(
                fontFamily: Fonts.light, fontSize: 16, color: AppColors.white)),
      );

  // login textfield heading
  Widget get secondTitle => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Text('Enter Your details',
            style: TextStyle(
                fontFamily: Fonts.light,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.white)),
      );
  /* email field */
  Widget get emailField => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CommonTextField(
          controller: authController.regEmailController,
          hint: "Email",
          prefixicon: Feather.mail,
          validator: (email) {
            if (email!.isEmpty) {
              return "Email address is required";
            } else if (!email.isEmail) {
              return "Enter valid email address";
            } else {
              return null;
            }
          },
        ),
      );

  /* password field */
  Widget get passwordField => /* password field */
      Obx(() => Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CommonTextField(
              controller: authController.regPasswordController,
              hint: "Password",
              prefixicon: Icons.lock_outline_rounded,
              /* suffix icon changed based on the obsecurity */

              suffixicon: authController.loginObsecure.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              obsecure: authController.loginObsecure.value,
              changeobsecure: () {
                /* changing password obsecure status */
                authController.changeLoginObsecure;
              },
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
            ),
          ));

  /* confirm password */
  Widget get confirmPasswordField => Obx(() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CommonTextField(
          controller: authController.regConfirmPasswordController,
          hint: "Confirm Password",
          prefixicon: Icons.lock_outline_rounded,
          /* suffix icon changed based on the obsecurity */

          suffixicon: authController.registerConfrimPasswordObsecure.value
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          obsecure: authController.registerConfrimPasswordObsecure.value,
          changeobsecure: () {
            /* changing password obsecure status */
            authController.changeRegisterConfirmPasswordObsecure;
          },
          validator: (confirmpassword) {
            if (confirmpassword == null || confirmpassword.isEmpty) {
              return "Confirm Password is required";
            } else if (confirmpassword !=
                authController.regPasswordController.text) {
              return "Password not matched";
            }

            return null;
          },
        ),
      ));

  /* term & conditions */
  Widget get termCondition => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Text(
              'By signing in, agree to the ',
              style: TextStyle(fontFamily: Fonts.light, color: AppColors.white),
            ),
            RichText(
                text: TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                        fontFamily: Fonts.medium, color: AppColors.primary)))
          ],
        ),
      );

  /* register button */
  Widget get registerButton => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: CommonButton(text: "Register", onPressed: () {
      if(registerKey.currentState!.validate()){
        authController.registration;
      }
    }),
  );

     /* already have an account */
  Widget get loginOption => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: Fonts.regular,
                  color: Colors.white),
            ),
            const SizedBox(width: 8.0),
            InkWell(
              onTap: () {
                Get.to(() =>  Login());
              },
              child: Text(
                "Login Now",
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fonts.regular,
                    color: AppColors.primary),
              ),
            )
          ],
        ),
      );
}
