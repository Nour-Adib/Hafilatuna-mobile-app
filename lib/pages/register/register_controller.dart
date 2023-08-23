import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/models/enums/accountType.enum.dart';
import 'package:hafilatuna/services/auth/auth.service.dart';
import 'package:hafilatuna/utility/error_handler.dart';
import 'package:hafilatuna/utility/logger.dart';
import 'package:hafilatuna/utility/snackbar.dart';

class RegisterController extends GetxController {
  RegExp eidRegex = RegExp(r'^784-[0-9]{4}-[0-9]{7}-[0-9]{1}$');

  TextEditingController firstNameTextFieldController = TextEditingController();
  TextEditingController lastNameTextFieldController = TextEditingController();
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController usernameTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();
  TextEditingController confirmPasswordTextFieldController =
      TextEditingController();
  TextEditingController phoneNumberTextFieldController =
      TextEditingController();
  TextEditingController emiratesIdTextFieldController = TextEditingController();
  TextEditingController dropdownTextFieldController = TextEditingController();
  var accountType = AccountType.Standalone.obs;
  var dropdownDisabled = false.obs;
  var dropdownDisabledText = 'Child'.obs;

  final List<DropdownMenuEntry<AccountType>> accountTypeMenuItems =
      <DropdownMenuEntry<AccountType>>[
    const DropdownMenuEntry(
      value: AccountType.Standalone,
      label: "Standalone",
    ),
    const DropdownMenuEntry(
      value: AccountType.Parent,
      label: "Parent",
    ),
    const DropdownMenuEntry(
      value: AccountType.Child,
      label: "Child",
    ),
  ];

  checkAge(year) {
    if (year.length == 18) {
      final currentYear = DateTime.now().year;
      final birthYear = int.parse(year.substring(4, 8));

      LoggerService().logDebug(currentYear - birthYear);
      if (currentYear - birthYear <= 15) {
        accountType.value = AccountType.Child;
        dropdownDisabled.value = true;
      }
    }
  }

  register() async {
    if (firstNameTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'First Name field cannot be empty');
      return;
    }

    if (lastNameTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Last Name field cannot be empty');
      return;
    }

    if (emailTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar('Error', 'Email field cannot be empty');
      return;
    }

    if (!emailTextFieldController.text.isEmail) {
      SnackBarService.showErrorSnackbar('Error', 'Invalid email');
      return;
    }

    if (usernameTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Username field cannot be empty');
      return;
    }

    if (emailTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar('Error', 'Email field cannot be empty');
      return;
    }

    if (emiratesIdTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Emirates ID field cannot be empty');
      return;
    }

    if (phoneNumberTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Phone Number field cannot be empty');
      return;
    }

    if (passwordTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Password field cannot be empty');
      return;
    }

    if (passwordTextFieldController.text.length < 8) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Password must be at least 8 characters long');
      return;
    }

    if (confirmPasswordTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Confirm password field cannot be empty');
      return;
    }

    if (passwordTextFieldController.text !=
        confirmPasswordTextFieldController.text) {
      SnackBarService.showErrorSnackbar('Error', 'Passwords do not match');
      return;
    }

    if (!eidRegex.hasMatch(emiratesIdTextFieldController.text)) {
      SnackBarService.showErrorSnackbar('Error', 'Invalid Emirates ID format');
      return;
    }

    sendRegistrationRequest();
  }

  sendRegistrationRequest() {
    final dio = Dio(); // Provide a dio instance
    final authServiceRepo = AuthService(dio);
    final SignUpRequest signUpRequest = SignUpRequest();
    signUpRequest.firstName = firstNameTextFieldController.text;
    signUpRequest.lastName = lastNameTextFieldController.text;
    signUpRequest.username = usernameTextFieldController.text;
    signUpRequest.email = emailTextFieldController.text;
    signUpRequest.eid = emiratesIdTextFieldController.text;
    signUpRequest.phoneNumber = phoneNumberTextFieldController.text;
    signUpRequest.password = passwordTextFieldController.text;
    signUpRequest.confirmPassword = confirmPasswordTextFieldController.text;
    signUpRequest.accountType = accountType.value;

    authServiceRepo.register(signUpRequest).then((value) {
      SnackBarService.showSuccessSnackbar('Success', 'Registration successful');
      sendToLoginScreen();
    }).catchError((error) {
      ErrorHandlerService.errorHandler(error);
    });
  }

  sendToLoginScreen() {
    Get.offNamed('/onboarding');
  }
}
