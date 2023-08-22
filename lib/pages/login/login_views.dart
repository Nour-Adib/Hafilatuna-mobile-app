import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/login/login_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenController c = Get.put(LoginScreenController());

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: const TopBar(
        pageTile: 'Login',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            SizedBox(
              width: Get.width * 1,
              child: Image(
                  image: Image.asset("assets/images/yellowBus.jpg").image),
            ),
            SizedBox(height: Get.height * 0.05),
            SizedBox(
                width: Get.width * 0.5,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: ("Email"), hintText: ("example@email.com")),
                  autofillHints: const [AutofillHints.email],
                )),
            SizedBox(
                width: Get.width * 0.5,
                child: TextFormField(
                  autofillHints: const [AutofillHints.password],
                  decoration: const InputDecoration(
                    labelText: ("Password"),
                  ),
                )),
            SizedBox(height: Get.height * 0.05),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffc806)),
                onPressed: () {
                  c.loginUser();
                },
                child: const Text("LOGIN",
                    style: TextStyle(color: Color(0xff000000))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
