import 'package:flutter/material.dart';
import 'package:task_manager/Data/services/auth_utility.dart';

import '../screens/create_user_profile.dart';
import '../screens/login_screen.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    key,
  }) : super(key: key);

  void _onTileClicked(BuildContext context) {
    // Navigate to a new screen when the ListTile is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateNewProfile()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTileClicked(context),
      child: ListTile(
        tileColor: Colors.green,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://yt3.googleusercontent.com/8w0sjWJ9cEbUqUog0lhDGVQhuKNGIZ7cM2Ce-tuwDWlgiTfOsCwuR08YE0qO9itv1EPftsOLzQ=s176-c-k-c0x00ffffff-no-rj-mo'),
          radius: 15,
        ),
        title: Text(
          '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'www.argho.roy488@gmail.com',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),

        trailing:
        IconButton(
          onPressed: () async {
            await AuthUtility.ClearUserInfo(); // Assuming 'clearUserInfo' is a static method

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
              );
          },
          icon: Icon(Icons.logout), // Add the appropriate icon here
        ),
      ),
    );
  }
}
