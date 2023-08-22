import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/register/register_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final RegisterController c = Get.put(RegisterController());

    return Scaffold(
      appBar: const TopBar(
        pageTile: 'Register',
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("Enter your first name")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("Enter your last name")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Emirates ID',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("7XX-XXXX-XXXXXXX")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("05X-XXX XXXX")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("example@email.com")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("Enter your username")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("Enter your password")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                              hintText: ("Re-enter your password")),
                          autofillHints: const [AutofillHints.email],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: SizedBox(
                      width: Get.width * 0.5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffc806)),
                          onPressed: () {
                            c.register();
                          },
                          child: const Text(
                            "NEXT",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
