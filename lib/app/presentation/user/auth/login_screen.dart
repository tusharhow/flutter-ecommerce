import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/state/auth/auth_controllers.dart';
import 'package:get/get.dart';
import '../../../components/navigation.dart';
import '../../../components/primary_button.dart';
import '../../../components/text_form_field.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

bool isLoading = false;
bool user = false;
final authController = Get.put(AuthControllers());

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'We missed you',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            FormFieldComponent(
              hintText: 'Enter Email',
              controller: authController.loginEmailController,
            ),
            const SizedBox(
              height: 20,
            ),
            FormFieldComponent(
              hintText: 'Enter Password',
              controller: authController.loginPasswordController,
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            ReusablePrimaryButton(
              childText: 'Sign In',
              buttonColor: AppColors.primaryColor,
              onPressed: () {
                authController.loginUser();
              },
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New to this app? ', style: TextStyle(fontSize: 16)),
                InkWell(
                  onTap: () {
                    push(context: context, widget: const SignUp());
                  },
                  child: const Text('Sign Up',
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
