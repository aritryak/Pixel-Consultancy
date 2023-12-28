import 'dart:developer';
import 'dart:math' as math;

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/commons/common.button.dart';
import 'package:short_video_app/commons/common.textfield.dart';
import 'package:short_video_app/controller/auth.controller.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final authController = Get.put(AuthController());

  /* login form key */
  GlobalKey<FormState> detailsFormKey =
      GlobalKey<FormState>(debugLabel: math.Random().nextInt(10).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Form(
        key: detailsFormKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            /* title */
            title,
            /* sub title */
            subtitle,
            /* name */
            nameField,
            /* phone */
            phoneField,
            /* gender title */
            genderTitle,
            /* gender option */
            genderOption,
            /* description*/
            descriptionField,
            /* save button */
            saveButton
          ]),
        ),
      ),
    );
  }

  //title text
  Widget get title => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          'Save Details',
          style: TextStyle(
              fontSize: 24, color: AppColors.white, fontFamily: Fonts.medium),
        ),
      );

  // subtitle
  Widget get subtitle => Text(
        'Please enter your detail below',
        // textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14.0,
      
            color: AppColors.white.withOpacity(0.4)),
      );

  /* phone field */
  Widget get nameField => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CommonTextField(
          hint: "Name",
          prefixicon: Feather.user,
          controller: authController.nameController,
          // prefix: countryCodePicker,
          validator: (name) {
            if (name == null || name.isEmpty) {
              return "Name is required";
            }
            return null;
          },
        ),
      );

  /* phone field */
  Widget get phoneField => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CommonTextField(
          hint: "Phone",
          prefixicon: Feather.phone,
          controller: authController.phoneControlller,
          // prefix: countryCodePicker,
          validator: (phone) {
            if (phone == null || phone.isEmpty) {
              return "Phone Number is required";
            } else if (!phone.isPhoneNumber) {
              return "This is not a valid phone number";
            }
            return null;
          },
        ),
      );

  // country code picker widget
  Widget get countryCodePicker => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CountryCodePicker(
            initialSelection: "IN",
            padding: EdgeInsets.zero,
            flagDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
            dialogBackgroundColor: AppColors.white,
            backgroundColor: AppColors.white,
            barrierColor: const Color(0xFF323232),
            dialogSize: Size(Get.width, Get.height),
            dialogTextStyle: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.0,
                fontFamily: Fonts.regular,
                color: AppColors.black),
            textStyle: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.0,
                fontFamily: Fonts.regular,
                color: AppColors.white),
          ),
          // Divider
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 0.2,
              color: AppColors.white.withOpacity(0.8),
              height: 35.0,
            ),
          )
        ],
      );

  /* gender title */
  Widget get genderTitle => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          "Select your gender",
          style: TextStyle(color: AppColors.white),
        ),
      );

  /* gender widget */
  Widget get genderOption => Obx(() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                authController.genderList.length,
                (index) => InkWell(
                      onTap: () {
                        authController.selectedGender.value = index;
                        switch (authController.selectedGender.value) {
                          case 0:
                            authController.gender.value = "Male";
                            log(authController.gender.value.toString());
                            break;
                          case 1:
                            authController.gender.value = "Female";
                            log(authController.gender.value.toString());
                            break;
                          case 2:
                            authController.gender.value = "Others";
                            log(authController.gender.value.toString());
                            break;
                          default:
                        }
                      },
                      child: Container(
                        width: 100,
                        decoration: decoration(index: index),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            authController.genderList[index].toString(),
                            textAlign: TextAlign.center,
                            style: textsyle(index: index),
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ));

  /* gender text style */
  TextStyle textsyle({int? index}) => TextStyle(
      color: authController.selectedGender.value == index
          ? AppColors.white
          : AppColors.black);

  /* gender list decoration */
  BoxDecoration decoration({int? index}) => BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(5),
      color: authController.selectedGender.value == index
          ? AppColors.primary
          : AppColors.white);

  /* description  */
  Widget get descriptionField => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CommonTextField(
          controller: authController.descriptionController,
          hint: "Description",
          maxLines: 3,
          prefixicon: null,
          maxLength: 100,
          validator: (desc) {
            if (desc!.isEmpty) {
              return "Description is required.";
            } else {
              return null;
            }
          },
        ),
      );

  /* save button  */
  Widget get saveButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CommonButton(
            text: "Save",
            onPressed: () {
              if (detailsFormKey.currentState!.validate()) {}
            }),
      );
}
