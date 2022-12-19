import 'package:flutter/material.dart';
import 'package:news_app/constats.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheWrapper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> putUserMoode(
      {required String key, required bool value}) async {
    return await prefs!.setBool(key, value);
  }

  static getUserMode({required key}) {
    return prefs!.getBool(key);
  }

  // Future<bool> setUserMode(String userData) async {
  //   try {
  //     // Obtain shared preferences.
  //     final prefs = await SharedPreferences.getInstance();
  //     // Save an String value to 'action' key.
  //     await prefs.setString(Constants.USER_DATA_Mode, userData);
  //     return true;
  //   } catch (error) {
  //     print(error);
  //     return false;
  //   }
  // }

  // Future<String?> getUserData() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final String? userData = prefs.getString(Constants.USER_DATA_KEY);
  //     return userData;
  //   } catch (error) {
  //     print(error);
  //     return 'Error in getting user Data';
  //   }
  // }

  // Future<bool?> getUserMode(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(key);
  // }
}
