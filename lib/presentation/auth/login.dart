// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:short_video_app/controller/auth.controller.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formKey = GlobalKey<FormState>();
  final auth = Get.put(AuthController());
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                phoneNumberTitle,
                phoneNumberSubTitle,
                phoneTextBoxTitle,
                phoneNumberTextField,
                verify,
                termCondition
              ],
            ),
          ),
        ),
      ),
    );
  }

  // login title
  Widget get phoneNumberTitle => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text('Your phone number',
            style: TextStyle(
                fontFamily: Fonts.regular,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.white)),
      );

  // login subtitle
  Widget get phoneNumberSubTitle => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('Please confirm country code and enter your phone number',
            style: TextStyle(
                fontFamily: Fonts.light, fontSize: 16, color: AppColors.white)),
      );

  // login textfield heading
  Widget get phoneTextBoxTitle => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Text('Enter Your phone number',
            style: TextStyle(
                fontFamily: Fonts.light,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.white)),
      );

  // phone number textfield
  Widget get phoneNumberTextField => IntlPhoneField(
    controller: auth.phone,
     style: TextStyle(color: AppColors.white),
    decoration: InputDecoration(
        hintText: ' Phone Number',
        hintStyle: TextStyle(color: AppColors.white),
        border: const OutlineInputBorder(
            borderSide: BorderSide(),
        ),
    ),
    initialCountryCode: 'IN',
    dropdownTextStyle: TextStyle(color: AppColors.white),
    
    onChanged: (phone) {
        print(phone.completeNumber);
    },
);
  // Widget get phoneNumberTextField => Padding(
  //       padding: const EdgeInsets.only(top: 20),
  //       child: TextFormField(
  //         controller: auth.phone,
  //         decoration: InputDecoration(
  //             enabledBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: AppColors.white)),
  //             focusedBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: AppColors.white)),
  //             hintText: 'Phone number',
  //             hintStyle: TextStyle(color: AppColors.white)),
  //         style: TextStyle(color: AppColors.white),
  //       ),
  //     );

// verify button
  Widget get verify => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Next >',
                style: TextStyle(fontFamily: Fonts.medium, fontSize: 18),
              ),
            )),
      );

  // term and condition
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
}
