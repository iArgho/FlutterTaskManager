import 'package:flutter/material.dart';
import 'bottom_nav_base_screen.dart';

class CreateNewProfile extends StatelessWidget {
  const CreateNewProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update Profile',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 10,),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'First Name',
              ),
            ),
            const SizedBox(height: 10,),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            const SizedBox(height: 10,),

            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Mobile No',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBaseScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),

            // Other Widgets can be added here
          ],
        ),
      ),
      )
    );
  }
}
