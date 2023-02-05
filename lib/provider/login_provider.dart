import 'dart:convert';
import 'dart:developer';

import 'package:bus_project/view/master_screen/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/api.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;
  Future<void> NormalLogin(
      {required String username,
      required String password,
      required BuildContext context}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    isLoading = true;
    notifyListeners();
    var response = await post(Uri.parse("${Api.baseUrl}LoginApi"),
        body: {"username": username, "password": password});

    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == true) {
        shared.setBool("isLogged", true);
        shared.setString("accessToken", data['access']);
        shared.setString("url", data["url_id"]);
        shared.setString("refreshToken", data['refresh']);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Sussessfully Logged in"),
          backgroundColor: Colors.green,
        ));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MasterScreen()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Username or password is wrong"),
          backgroundColor: Colors.red,
        ));
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
