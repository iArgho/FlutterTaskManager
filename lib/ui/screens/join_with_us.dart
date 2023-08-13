import 'package:flutter/material.dart';
import 'package:task_manager/Data/utils/urls.dart';
import '../../Data/models/network_response.dart';
import '../../Data/services/network_caller.dart';
import '../widgets/screen_background.dart';
import 'login_screen.dart';

class JoinWithUs extends StatefulWidget {
  const JoinWithUs({Key? key}) : super(key: key);

  @override
  State<JoinWithUs> createState() => _JoinWithUsState();
}

class _JoinWithUsState extends State<JoinWithUs> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();




  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool signUpInProgress = false;

  Future<void> userSignUp() async {

    signUpInProgress = true;
    if(mounted){
      setState(() {
      });
    }

    final NetworkResponse response = await NetWorkCaller().postRequest(Urls.registration, <String,dynamic>{

      "email":_emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile":_mobileTEController.text.trim(),
      "password":_passwordTEController.text,
      "photo":""

    });

    if(response.isSuccess){
      _emailTEController.clear();
      _firstNameTEController.clear();
      _lastNameTEController.clear();
      _mobileTEController.clear();
      _passwordTEController.clear();
    }

    signUpInProgress = false;
    if(mounted){
      setState(() {

      });
    }
    if (response.isSuccess) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration success!')),
        );
      }
    } else {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration failed')),
        );
      }
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Join With Us',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16,),

                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      // Validation logic
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'First name',
                      ),
                      // Validation logic
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Last name',
                      ),
                      // Validation logic
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Mobile No',
                      ),
                      // Validation logic
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your Mobile No';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _passwordTEController,
                      keyboardType: TextInputType.text, // Use TextInputType.text
                      obscureText: true, // This hides the password input
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      // Validation logic
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: signUpInProgress == false,
                        replacement: Center( child: CircularProgressIndicator(),),

                        child: ElevatedButton(
                          onPressed: () {
                            if(!_formKey.currentState!.validate()){
                                return;
                            }
                              userSignUp();
                            },
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  (route) => false,
                            );

                          },
                          child:
                          const Text("Sign In"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
