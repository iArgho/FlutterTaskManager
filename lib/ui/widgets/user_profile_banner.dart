import 'package:flutter/material.dart';

import '../screens/create_user_profile.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    key,
  }) : super(key: key);

  void _onTileClicked(BuildContext context) {
    // Navigate to a new screen when the ListTile is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNewProfile()),
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
              'https://web.facebook.com/photo/?fbid=5295229760544530&set=a.101158663285025'),
          radius: 15,
        ),
        title: Text(
          'Ar G Ho',
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
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Text('User Profile Screen'),
      ),
    );
  }
}
