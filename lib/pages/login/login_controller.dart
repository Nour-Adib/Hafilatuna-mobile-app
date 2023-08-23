import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/services/auth/auth.service.dart';
import 'package:hafilatuna/utility/logger.dart';
import 'package:hafilatuna/utility/shared_preferences.dart';
import 'package:hafilatuna/utility/snackbar.dart';

class LoginScreenController extends GetxController {
  var width = Get.width;
  var length = Get.height;

  LoggerService loggerService = LoggerService();

  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  loginUser() {
    if (emailTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar('Error', 'Email field cannot be empty');
      return;
    }

    if (!emailTextFieldController.text.isEmail) {
      SnackBarService.showErrorSnackbar('Error', 'Invalid email');
      return;
    }

    if (passwordTextFieldController.text.isEmpty) {
      SnackBarService.showErrorSnackbar(
          'Error', 'Password field cannot be empty');
      return;
    }

    final dio = Dio(); // Provide a dio instance
    final authServiceRepo = AuthService(dio);
    final LoginRequest loginRequest = LoginRequest();
    loginRequest.email = emailTextFieldController.text;
    loginRequest.password = passwordTextFieldController.text;

    authServiceRepo.login(loginRequest).then((response) async {
      SharedPreferencesService.setInShared(
          'accessToken', response.accessToken.toString());
      SnackBarService.showSuccessSnackbar('Success', 'Login successful');
      Get.offNamed('/home');

      return;
    }).catchError((error) {
      loggerService.logError(error.toString());
      switch (error.response.statusCode) {
        case 401:
          SnackBarService.showErrorSnackbar(
              'Error', 'Invalid email or password');
          break;
        case 500:
          SnackBarService.showErrorSnackbar('Error', 'Internal server error');
          break;
        case 403:
          SnackBarService.showErrorSnackbar('Error', 'Banned user');
          break;
        default:
          SnackBarService.showErrorSnackbar('Error', 'Unknown error');
          break;
      }
    });
  }
}
