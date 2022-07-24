import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/admin/admin_homepage.dart';
import 'app/presentation/main/bottom_nav_screens.dart/bottom_nav_screen.dart';
import 'app/presentation/main/splash/splash_screen.dart';
import 'app/presentation/user/auth/login_screen.dart';
import 'app/state/auth/auth_controllers.dart';

abstract class Dic {
  static final find = Get.find;

  static Future<void> setUp() async {
    Get.lazyPut(() => AuthControllers());
    Get.lazyPut(() => AuthControllers());
  }

  static Future<void> init() async {
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('userID');
    final user = await _firestore.collection('users').doc(token).get();
    if (prefs.getBool('seen') == null) {
      prefs.setBool('seen', true);
      Get.offAll(() => const SplashScreen());
    } else {
      final token = prefs.getString('userID');
      if (token != null) {
        print('token: $token');
        if (user.data()!['isAdmin'] == true) {
          Get.offAll(() => const AdminHomePage());
        } else {
          Get.offAll(() => const MyHomePage());
        }
      } else {
        print('Please login');
        Get.offAll(() => const SignInScreen());
      }
    }
  }
}
