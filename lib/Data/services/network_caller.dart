import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:task_manager/Data/models/network_response.dart';
import 'package:task_manager/Data/services/auth_utility.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/ui/screens/login_screen.dart';

class NetWorkCaller {

  Future<NetworkResponse> getRequest(String url) async {


    try {
      Response response = await get(
          Uri.parse(url),
        headers: {
          'Token': AuthUtility.userInfo.token.toString(),
        }
      );

      if (response.statusCode == 200) {
        return NetworkResponse(true, response.statusCode,jsonDecode(response.body));
      }
      else {
        return NetworkResponse(false, response.statusCode,null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }


  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Token': AuthUtility.userInfo.token.toString(),
          },
          body: jsonEncode(body)
      );

      log(response.statusCode.toString()) ;
      log (response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(true, response.statusCode,jsonDecode(response.body));
      }

      else if(response.statusCode==401){
        gotoLogin();
      }
      else {
        return NetworkResponse(false, response.statusCode,null);
      }
    } catch (e)  {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> gotoLogin() async {
    await AuthUtility.ClearUserInfo();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context)=>LoginScreen()),
            (route) => false);
}
}