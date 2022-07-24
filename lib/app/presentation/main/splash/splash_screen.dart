import 'package:flutter/material.dart';
import '../../../../di.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Dic.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: Text('fCOM',
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
