import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Data/models/longin_model.dart';

class AuthUtility{

  AuthUtility._();
  static LoginModel userInfo = LoginModel();

  static Future<void> saveUserInfo(LoginModel model) async{
    SharedPreferences _sharedPreps= await SharedPreferences.getInstance();
    await _sharedPreps.setString('user-data', jsonEncode(model.toJson()));
    userInfo=model;
  }

  static Future<LoginModel> getUserInfo() async{
    SharedPreferences _sharedPreps= await SharedPreferences.getInstance();
    String? value= _sharedPreps.getString('user-data')!;
   return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> ClearUserInfo() async {
    SharedPreferences _sharedPreps= await SharedPreferences.getInstance();
   await _sharedPreps.clear();
  }

  static Future<bool> checkIfUserLoggedIn() async{
    SharedPreferences _sharedPreps= await SharedPreferences.getInstance();
    bool isLogIn =  _sharedPreps.containsKey('user-data');
    if (isLogIn) {
      userInfo= await getUserInfo();
  }
    return isLogIn;

  }

}