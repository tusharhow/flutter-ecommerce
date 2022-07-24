import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/components/navigation.dart';
import 'package:flutter_ecommerce/app/state/auth/auth_controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/add_product.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthControllers());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                controller.logoutUser();
              },
              child: Text('Logout'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                push(context: context, widget: const AddProductScreen());
              },
              child: Text('Add Product'),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Get Products'),
          ),
        ],
      ),
    );
  }
}
