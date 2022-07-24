import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/presentation/main/bottom_nav_screens.dart/category_screen.dart';
import 'package:flutter_ecommerce/app/presentation/main/bottom_nav_screens.dart/user_profile.dart';

import '../../../utils/app_colors.dart';
import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: TabBarView(
        children: [
          HomePageMain(),
          CategoryScreen(),
          UserProfile(),
        ],
        physics:const NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: TabBar(
        labelColor: AppColors.primaryColor,
        unselectedLabelColor:const Color(0xff808080),
        unselectedLabelStyle:
            const TextStyle(fontSize: 11.0, color: Color(0xff808080)),
        labelStyle: const TextStyle(fontSize: 11.0),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
        ),
        indicatorColor: Colors.black54,
        tabs: const [
          Tab(
            icon: ImageIcon(AssetImage('assets/icons/home.png')),
            text: 'Home',
          ),
          Tab(
            icon: ImageIcon(AssetImage('assets/icons/category.png')),
            text: 'Categories',
          ),
          Tab(
            icon: ImageIcon(AssetImage('assets/icons/user.png')),
            text: 'Profile',
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}
