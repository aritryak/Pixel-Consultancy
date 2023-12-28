// ignore_for_file: avoid_unnecessary_containers

import 'dart:math' as math;

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/commons/common.button.dart';
import 'package:short_video_app/commons/common.textfield.dart';
import 'package:short_video_app/controller/auth.controller.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';
import 'package:short_video_app/presentation/auth/otpverification.dart';
import 'package:short_video_app/presentation/auth/register.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /* login form key */
  GlobalKey<FormState> loginkey =
      GlobalKey<FormState>(debugLabel: math.Random().nextInt(10).toString());

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: loginkey,
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
              /* forgot password */
              forgotpassword,
              /* login button */
              loginButton,

              orOption,
              socialMediaIcons,
              // termCondition,
              registerOption
            ],
          ),
        ),
      ),
    );
  }

  // login title
  Widget get title => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text('Welcome Back!',
            style: TextStyle(
                fontFamily: Fonts.regular,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.white)),
      );

  // login subtitle
  Widget get subTitle => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('Please confirm country code and enter your phone number',
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
          controller: authController.emailController,
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
              controller: authController.passwordController,
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

  /* forgot password */
  Widget get forgotpassword => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text("Forgot Password?",
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold)),
        ),
      );

  /* login button */
  Widget get loginButton => Obx(() {
        if (authController.loginButtonLoading.value) {
          return  Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CommonButton(
                text: "Login",
                onPressed: () {
                  if (loginkey.currentState!.validate()) {
                    authController.login;
                  }
                }),
          );
        }
      });

  // // term and condition
  // Widget get termCondition => Padding(
  //       padding: const EdgeInsets.only(top: 30),
  //       child: Row(
  //         children: [
  //           Text(
  //             'By signing in, agree to the ',
  //             style: TextStyle(fontFamily: Fonts.light, color: AppColors.white),
  //           ),
  //           RichText(
  //               text: TextSpan(
  //                   text: 'Terms & Conditions',
  //                   style: TextStyle(
  //                       fontFamily: Fonts.medium, color: AppColors.primary)))
  //         ],
  //       ),
  //     );

  // OR option
  Widget get orOption => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "or continue with",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 13,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
      );

  // Social media icons
  Widget get socialMediaIcons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Image.network(
                "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png"),
          )
          // socialMediaCommon(
          //     icon:
          //         "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png"),
          // socialMediaCommon(
          //     icon:
          //         "https://cdn.freebiesupply.com/logos/thumbs/2x/facebook-logo-2019-thumb.png")
        ],
      );

  /* register option */
  Widget get registerOption => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: Fonts.regular,
                  color: Colors.white),
            ),
            const SizedBox(width: 8.0),
            InkWell(
              onTap: () {
                Get.to(() => const RegisterScreen());
              },
              child: Text(
                "Register Now",
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
