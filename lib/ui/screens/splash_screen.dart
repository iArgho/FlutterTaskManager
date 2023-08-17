import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/utils/asssets_utils.dart';

import '../../Data/services/auth_utility.dart';
import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {

      final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();

      if(mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => isLoggedIn? BottomNavBaseScreen(): LoginScreen()),
              (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child:
        Center(
          child: SvgPicture.asset(
            AssetsUtils.logoSVG,
            width: 150,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

