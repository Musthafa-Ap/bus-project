import 'dart:convert';
import 'dart:developer';

import 'package:bus_project/model/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/api.dart';

class DriverProvider with ChangeNotifier {
  bool _isDeleting = false;
  bool get isDeleting => _isDeleting;
  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }

  bool _isCreatingLoading = false;
  bool get isCreatingLoading => _isCreatingLoading;
  set isCreatingLoading(bool value) {
    _isCreatingLoading = value;
    notifyListeners();
  }

  DriverModel? driverList;
  bool _isDriverListLoading = false;
  bool get isDriverListLoading => _isDriverListLoading;
  set isDriverListLoading(bool value) {
    _isDriverListLoading = value;
    notifyListeners();
  }

  Future<void> getDriverList() async {
    isDriverListLoading = true;
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? url = shared.getString("url");
    String? access = shared.getString("accessToken");

    try {
      var response = await get(Uri.parse("${Api.baseUrl}/DriverApi/$url/"),
          headers: {"Authorization": "Bearer $access"});
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == true) {
          driverList = DriverModel.fromJson(data);
        } else {
          driverList = null;
        }
      }
      notifyListeners();
      isDriverListLoading = false;
    } catch (e) {
      isDriverListLoading = false;

      log(e.toString());
    }
  }

  Future<void> addDriver(
      {required String number,
      required String license,
      required String name,
      required BuildContext context}) async {
    isCreatingLoading = true;
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? url = shared.getString("url");
    String? access = shared.getString("accessToken");
    var response = await post(Uri.parse("${Api.baseUrl}/DriverApi/$url/"),
        headers: {"Authorization": "Bearer $access"},
        body: {"name": name, "mobile": number, "license_no": license});
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data["message"]),
          backgroundColor: Colors.green,
        ));
        getDriverList();
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong"),
          backgroundColor: Colors.red,
        ));
      }
    }
    isCreatingLoading = false;
  }

  Future<void> deleteDriver(
      {required String driverId, required BuildContext context}) async {
    isDeleting = true;
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? url = shared.getString("url");
    String? access = shared.getString("accessToken");
    var respose = await delete(Uri.parse("${Api.baseUrl}/DriverApi/$url/"),
        headers: {"Authorization": "Bearer $access"},
        body: {"driver_id": driverId});
    log(respose.body);
    log(respose.statusCode.toString());
    if (respose.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(respose.body);
      if (data["status"] == true) {
        getDriverList();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data["message"]),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong"),
          backgroundColor: Colors.red,
        ));
      }
    }
    isDeleting = false;
  }
}
