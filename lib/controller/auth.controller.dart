import 'dart:convert';
import 'dart:developer';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:short_video_app/commons/common.flash.dart';
import 'package:short_video_app/model/customers.model.dart';
import 'package:short_video_app/presentation/bottomnav/bottom.nav.screen.dart';
import 'package:short_video_app/services/auth.services.dart';
import 'package:short_video_app/services/cookies.services.dart';

class AuthController extends GetxController {
  //otp Field controller
  TextEditingController otpController = TextEditingController();

  /* login screen controller */
  /* email controller  */
  final emailController = TextEditingController();
  /* password controller */
  final passwordController = TextEditingController();

  /* login obsecure */
  RxBool loginObsecure = false.obs;

  /* change login obsecure */
  void get changeLoginObsecure => loginObsecure.value = !loginObsecure.value;
  /* login button loader */
  RxBool loginButtonLoading = false.obs;

  /* register screen controller */
  /* email  */
  final regEmailController = TextEditingController();
  /*password */
  final regPasswordController = TextEditingController();
  /* confirm password */
  final regConfirmPasswordController = TextEditingController();

  /* register password obsecure */
  RxBool registerPasswordObsecure = false.obs;

  /* change password obsecure */
  void get changeRegisterPasswordObsecure =>
      registerPasswordObsecure.value = !registerPasswordObsecure.value;

  /* confirm password obsecure */
  RxBool registerConfrimPasswordObsecure = false.obs;

  /* change confirm password obsecure */
  void get changeRegisterConfirmPasswordObsecure =>
      registerConfrimPasswordObsecure.value =
          !registerConfrimPasswordObsecure.value;

  /* registration loader */
  RxBool registrationLoading = false.obs;

  /*  customer model */
  Rx<CustomerModel> customer = CustomerModel().obs;

  /* function for customer registration */
  get registration async {
    registrationLoading(true);

    try {
      /* register customer object */
      CustomerModel regcustomer = CustomerModel(
        email: regEmailController.text.trim(),
        password: regPasswordController.text.trim(),
      );

      log(regcustomer.email.toString());
      final tempCustomer =
          await AuthServices.register(regcustomer: regcustomer);
      // log(tempCustomer.toString());
      if (tempCustomer != null) {
        final parsedCustomer = jsonEncode(tempCustomer.toJson());
        await CookieService.saveCookie(key: "customers", value: parsedCustomer);

        customer.value = tempCustomer;
        FlashMessage.show(title: "Registered successfully", isSuccess: true);
        Get.to(() => BottomNavBarScreen());
      } else {
        return FlashMessage.show(
            title: "Facing some issue with registration", isError: true);
      }
    } catch (e) {
      return FlashMessage.show(title: e.toString(), isError: true);
    }

    /* register button stops loading */
    registrationLoading(false);
    // }
  }

  /* fuction for login  */
  void get login async {
    loginButtonLoading(true);

    /* preparing customer model for the login */
    final customerObject = CustomerModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      /* authenticating the customer using provided email and password */
      final customer =
          await AuthServices().loginService(loginCustomer: customerObject);
      if (customer != null) {
        // if any customer exists save customer Id in cookies
        await CookieService.saveCookie(
            key: "id", value: customer.id.toString());

        /* saving customer details */
        await CookieService.saveCookie(
            key: "customer", value: jsonEncode(customer));

        FlashMessage.show(title: "Welcome Back!", isSuccess: true);
        Get.to(() => BottomNavBarScreen());
      } else {
        FlashMessage.show(title: "Facing some issue with login", isError: true);
      }
    } catch (e) {
      /* some error occurs */
      FlashMessage.show(title: e.toString());
    }
    /* login button end loading */
    loginButtonLoading(false);
  }

  /* profile details screen  */
  /* selected gender */
  RxInt selectedGender = 0.obs;
  RxString gender = "".obs;
  List genderList = ["Male", "Female", "Others"];

  /* name controller */
  final nameController = TextEditingController();
  // phone controller
  TextEditingController phoneControlller = TextEditingController();
  /* description */
  TextEditingController descriptionController = TextEditingController();
}
