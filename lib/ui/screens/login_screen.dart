import 'package:flutter/material.dart';
import 'package:task_manager/Data/models/network_response.dart';
import 'package:task_manager/Data/services/auth_utility.dart';
import 'package:task_manager/Data/services/network_caller.dart';
import 'package:task_manager/Data/utils/urls.dart';
import 'package:task_manager/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import '../../Data/models/longin_model.dart';
import 'email_verification_screen.dart';
import 'join_with_us.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    Map<String, dynamic> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    };

    final NetworkResponse response =
    await NetWorkCaller().postRequest(Urls.login, requestBody);

    if (response.isSuccess) {

      LoginModel model = LoginModel. fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBaseScreen()),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get Started With',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 16,),


                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => login(context),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),


                const SizedBox(height: 10,),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmailVerificationScreen()),
                      );
                    },

                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JoinWithUs()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
