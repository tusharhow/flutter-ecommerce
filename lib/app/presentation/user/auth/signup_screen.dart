import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/navigation.dart';
import '../../../components/primary_button.dart';
import '../../../components/text_form_field.dart';
import '../../../state/auth/auth_controllers.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  final authController = Get.put(AuthControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'We are excited for you',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // select admin and user checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Checkbox(
                    value: authController.isAdmin,
                    onChanged: (value) {
                      setState(() {
                        authController.isAdmin = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(children: [
                FormFieldComponent(
                  hintText: 'Full Name',
                  controller: authController.nameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldComponent(
                  hintText: 'Enter Email',
                  controller: authController.emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldComponent(
                  hintText: 'Enter Phone No.',
                  controller: authController.phoneController,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldComponent(
                  hintText: 'Enter Password',
                  controller: authController.passwordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldComponent(
                  hintText: 'Enter City',
                  controller: authController.cityController,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldComponent(
                  hintText: 'Enter Address',
                  controller: authController.addressController,
                ),

                // const SizedBox(
                //   height: defaultPadding * 2,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GFCheckbox(
                //       size: GFSize.SMALL,
                //       activeBgColor: GFColors.SUCCESS,
                //       onChanged: (value) {
                //         setState(() {
                //           isChecked = value;
                //         });
                //       },
                //       value: isChecked,
                //     ),
                //     const Text.rich(
                //       TextSpan(
                //         children: [
                //           TextSpan(
                //               text: ' I have read and accept ',
                //               style:
                //                   TextStyle(color: Colors.black, fontSize: 16)),
                //           TextSpan(
                //               text: 'Terms & Conditions',
                //               style:
                //                   TextStyle(color: Colors.blue, fontSize: 16))
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                ReusablePrimaryButton(
                    childText: 'Sign Up',
                    buttonColor: AppColors.primaryColor,
                    textColor: Colors.black,
                    onPressed: () {
                      // isChecked == true
                      //     ? Navigator.pushAndRemoveUntil(
                      //         context,
                      //         push(
                      //             context: context,
                      //             widget: const VerifyOtpInputScreen()),
                      //         (route) => false)
                      //     : showModalBottomSheet(
                      //         context: context,
                      //         builder: (context) {
                      //           return Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: <Widget>[
                      //               ListTile(
                      //                 leading: const Icon(Icons.photo),
                      //                 title: const Text(
                      //                   'Make sure you are agree to our terms and conditions',
                      //                   style: TextStyle(),
                      //                 ),
                      //                 onTap: () {
                      //                   Navigator.pop(context);
                      //                 },
                      //               ),
                      //             ],
                      //           );
                      // });

                      authController.createAccount();
                    }),
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        push(context: context, widget: const SignInScreen());
                      },
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
