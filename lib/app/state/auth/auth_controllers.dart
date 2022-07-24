import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/models/user.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../admin/admin_homepage.dart';
import '../../presentation/main/bottom_nav_screens.dart/bottom_nav_screen.dart';
import '../../presentation/main/bottom_nav_screens.dart/home_page.dart';
import '../../presentation/user/auth/login_screen.dart';

class AuthControllers extends GetxController {
  // sign up text editing controllers

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  bool isAdmin = false;
  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign up
  Future<void> createAccount() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        borderRadius: 10,
      );
      return;
    }
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(user.user!.uid).set(
      {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "city": cityController.text,
        "address": addressController.text,
        "postalCode": postCodeController.text,
        "mobileNumber": phoneController.text,
        "isAdmin": isAdmin,
      },
    );
    if (user != null) {
      Get.offAll(const SignInScreen());
    } else {
      print('error');
    }
  }

  Future<void> loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (loginEmailController.text.isEmpty ||
        loginPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 10);
      return;
    }
    final firestore = FirebaseFirestore.instance;
    final user = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    if (user != null) {
      // lets save user with shared prefrences
      prefs.setString("userID", _auth.currentUser!.uid);
      print(_auth.currentUser!.uid);
      final user =
          await firestore.collection('users').doc(_auth.currentUser!.uid).get();
      update();
      if (user.data()!['isAdmin'] == true) {
        print('admin');
        update();
        Get.offAll(() => const AdminHomePage());
      } else {
        update();
        print('user');
        Get.offAll(() => const MyHomePage());
      }
    } else {
      print('error');
    }
  }

  Future<UserModel> getUserDetails() async {
    final firestore = FirebaseFirestore.instance;
    final user =
        await firestore.collection('users').doc(_auth.currentUser!.uid).get();
    if (user != null) {
      return UserModel.fromJson(user.data() as Map<String, dynamic>);
    } else {
      print('error');
    }
    return UserModel.fromJson(user.data() as Map<String, dynamic>);
  }

  // Let's make a function for logout

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(const SignInScreen());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
