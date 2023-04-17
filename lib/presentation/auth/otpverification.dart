// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:short_video_app/controller/auth.controller.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';
import 'package:short_video_app/presentation/video/searchreel.dart';

class OTPVerification extends StatefulWidget {
   OTPVerification({super.key, this.phone});
  final String? phone;
  
  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  
  final auth = Get.put(AuthController());
  
  final formKey = GlobalKey<FormState>();
  int count = 60;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0.0,
        leading: const Icon(
          Feather.chevron_left,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verificationTitle,
                  verificationSubTitle,
                  otpField,
                  verify,
                  sessionEnd,
                  resendCode
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    /// Initialize a periodic timer with 1 second duration
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        setState(() {
          if (count < 1) {
            timer.cancel();
          } else {
            count--;
          }
        });
      },
    );
  }

  // verification title
  Widget get verificationTitle => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text('Verify account!',
            style: TextStyle(
                fontFamily: Fonts.regular,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.white)),
      );

  // verification subtitle
  Widget get verificationSubTitle => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('Enter 4-digit code sent at ${widget.phone}',
            style: TextStyle(
                fontFamily: Fonts.light, fontSize: 16, color: AppColors.white)),
      );

//otp widget
  Widget get otpField => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
            child: Pinput(
          autofocus: true,
          controller: auth.otpController,
          length: 4,
          validator: (otp) {
            if (otp!.isEmpty) {
              return 'Plaese enter otp';
            } else {
              return null;
            }
          },
        )),
      );

// verify otp
  Widget get verify => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
               FocusManager.instance.primaryFocus!.unfocus();
              if (formKey.currentState!.validate()) {
                Get.to(const SearchReel());
              }
              else{
                Get.snackbar('Something wrong', 'please enter otp', colorText: AppColors.white);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Verify >',
                style: TextStyle(fontFamily: Fonts.medium, fontSize: 18),
              ),
            )),
      );

  // session end text
  Widget get sessionEnd => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          'The session will end in $count seconds',
          style: TextStyle(fontFamily: Fonts.light, color: AppColors.white),
        ),
      );

  // resend code
  Widget get resendCode => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Text(
              "Didn't get code? ",
              style: TextStyle(fontFamily: Fonts.light, color: AppColors.white),
            ),
            RichText(
                text: TextSpan(
                    text: 'Resend Code',
                    style: TextStyle(
                        fontFamily: Fonts.medium, color: AppColors.primary)))
          ],
        ),
      );
}
