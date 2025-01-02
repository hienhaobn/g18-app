import 'dart:convert';
import 'dart:io';

import 'package:app/base/config.dart';
import 'package:app/base/const.dart';
import 'package:app/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


class StorageApp {
  static final _singleton = StorageApp._internal();
  factory StorageApp() {
    return _singleton;
  }
  static String userName = '';
  static String token = '';
  StorageApp._internal();
  static RxBool isShowNotification = false.obs;
  static final _storage = FlutterSecureStorage();
  // luu lai vi tri truoc do cua icon thong bao
  static double _nearestDx = DX_DEFAULT_VALUE;
  static double _nearestDy = DY_DEFAULT_VALUE;
  static Future<String> getTokenAuthen() async {
    String token = await _storage.read(key: KEY_TOKEN_AUTHEN) ?? '';
    return token;
  }

  static Future<String> getRefreshToken() async {
    String token = await _storage.read(key: KEY_REFRESH_TOKEN) ?? '';
    return token;
  }

  static Future<void> setTokenAuthen(String value) async {
    token = value;
    await _storage.write(key: KEY_TOKEN_AUTHEN, value: value);
  }

  static Future<void> setRefreshToken(String value) async {
    await _storage.write(key: KEY_REFRESH_TOKEN, value: value);
  }

  static Future<void> setAccountLogin(String value) async {
    userName = value;
    await _storage.write(key: KEY_ACCOUNT, value: value);
  }

  static Future<String> getAccountLogin() async {
    String value = await _storage.read(key: KEY_ACCOUNT) ?? '';
    return value;
  }

  static Future<void> setPasswordLogin(String value) async {
    await _storage.write(key: KEY_PASSWORD, value: value);
  }

  static Future<String> getPasswordLogin() async {
    String value = await _storage.read(key: KEY_PASSWORD) ?? '';
    return value;
  }

  static Future<void> setPasswordBioLogin(String value) async {
    await _storage.write(key: KEY_PASSWORD_BIO, value: value);
  }

  static Future<String> getPasswordBioLogin() async {
    String value = await _storage.read(key: KEY_PASSWORD_BIO) ?? '';
    return value;
  }

  static Future<void> setUserEmail(String value) async {
    await _storage.write(key: KEY_USER_EMAIL, value: value);
  }

  static Future<String> getUserEmail() async {
    String value = await _storage.read(key: KEY_USER_EMAIL) ?? '';
    return value;
  }

  // static Future<void> setTokenAfterLogin(String value) async {
  //   await _storage.write(key: KEY_TOKEN_AFTER_LOGIN, value: value);
  // }
  static Future<void> setWidthRatio(double value) async {
    await prefs.setString(WIDTH_RATIO, value.toStringAsFixed(4));
  }

  static Future<void> setHeightRatio(double value) async {
    await prefs.setString(HEIGHT_RATIO, value.toStringAsFixed(4));
  }

  static double? getWidthRatio() {
    var data = prefs.getString(WIDTH_RATIO);
    if (data == null) {
      return null;
    }
    return double.parse(data);
  }

  static double? getHeightRatio() {
    var data = prefs.getString(HEIGHT_RATIO);
    if (data == null) {
      return null;
    }
    return double.parse(data);
  }

  static void setTimeExpriredToken(int seconds) {
    prefs.setString(KEY_TIME_TOKEN,
        DateTime.now().add(Duration(seconds: seconds - 30)).toIso8601String());
  }

  static void setPositionNoti(double dx, double dy) {
    // logger.d("dx: $dx, dy: $dy");
    _nearestDx = getDx() ?? DX_DEFAULT_VALUE;
    _nearestDy = getDy() ?? DY_DEFAULT_VALUE;

    prefs.setDouble(DX_POSITION, dx);
    prefs.setDouble(DY_POSITION, dy);
  }

  static void removePositionNoti() {
    // logger.d("_nearestDx: $_nearestDx, _nearestDy: $_nearestDy");
    prefs.setDouble(DX_POSITION, _nearestDx);
    prefs.setDouble(DY_POSITION, _nearestDy);
  }

  static double? getDx() {
    var data = prefs.getDouble(DX_POSITION);
    if (data == null) {
      return null;
    }
    return data;
  }

  static double? getDy() {
    var data = prefs.getDouble(DY_POSITION);
    if (data == null) {
      return null;
    }
    return data;
  }

  static void setTimeExpriredBio() {
    prefs.setString(
        KEY_TIME_BIO, DateTime.now().add(Duration(days: 3)).toIso8601String());
  }

  static void setUserId(int userId) {
    prefs.setInt(KEY_USER_ID, userId);
  }

  static void setAccountId(int accountId) {
    prefs.setInt(KEY_ACCOUNT_ID, accountId);
  }

  static void setLanguage(String locale) {
    prefs.setString(KEY_LANGUAGE, locale);
  }

  static String getLanguage() {
    return prefs.getString(KEY_LANGUAGE) ?? 'vi';
  }

  static void setActiveTopup(bool isActive) {
    prefs.setBool(KEY_TOPUP, isActive);
  }

  static bool getActiveTopup() {
    return prefs.getBool(KEY_TOPUP) ?? false;
  }

  static void setActiveBiometric(bool isActive) {
    prefs.setBool(KEY_BIMOETRIC, isActive);
  }

  static bool getActiveBiometric() {
    return prefs.getBool(KEY_BIMOETRIC) ?? false;
  }

  static void setEnv(String env) {
    prefs.setString(KEY_ENV, env);
  }

  static String getEnv() {
    return prefs.getString(KEY_ENV) ?? enviroments.last;
  }

  // static String getPathImageLanguage() {
  //   final locale = getLanguage();
  //   return locale == 'vi' ? ImagePath.vietnam : ImagePath.america;
  // }

  static int getUserId() {
    return prefs.getInt(KEY_USER_ID) ?? -1;
  }

  static int getAccountId() {
    return prefs.getInt(KEY_ACCOUNT_ID) ?? -1;
  }

  static bool isTokenExprited() {
    final now = DateTime.now();
    final timeExprited = prefs.getString(KEY_TIME_TOKEN) ?? '';
    if (timeExprited.isEmpty) {
      return true;
    } else {
      return now.isAfter(DateTime.parse(timeExprited));
    }
  }

  static bool isTimeBioExprited() {
    final now = DateTime.now();
    final timeExprited = prefs.getString(KEY_TIME_BIO) ?? '';
    if (timeExprited.isEmpty) {
      return true;
    } else {
      return now.isAfter(DateTime.parse(timeExprited));
    }
  }

  // static Future<String?> getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     return '${androidInfo.device}${androidInfo.id}';
  //   } else {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     return iosInfo.identifierForVendor;
  //   }
  // }

  static void setUserType(String type) {
    prefs.setString(KEY_USER_TYPE, type);
  }

  static String getUserType() {
    return prefs.getString(KEY_USER_TYPE) ?? '';
  }






  static DateTime getDefaultTimeDeparture() {
    final data = prefs.getString(KEY_TIME_DEPARTURE);
    final now = DateTime.now();
    if (data == null) {
      return now;
    }
    final time = DateTime.parse(data);
    if (time.isBefore(now)) {
      return now;
    }
    return time;
  }

  static DateTime getDefaultTimeArrival() {
    final data = prefs.getString(KEY_TIME_ARRIVAL);
    final now = DateTime.now();
    if (data == null) {
      return now;
    }
    final time = DateTime.parse(data);
    if (time.isBefore(now)) {
      return now;
    }
    return time;
  }

  static Future<void> clearAllStorage({bool isClearAll = false}) async {
    prefs.remove(WIDTH_RATIO);
    prefs.remove(HEIGHT_RATIO);
    prefs.remove(KEY_KEEP_LOGGED);
    prefs.remove(KEY_ACCOUNT_ID);
    prefs.remove(KEY_ACCOUNT_ID);
    prefs.remove(KEY_LANGUAGE);
    prefs.remove(KEY_USER_ID);
    prefs.remove(KEY_USER_TYPE);
    if (isClearAll) {
      _storage.deleteAll();
    } else {
      _storage.delete(key: KEY_TOKEN_AUTHEN);
      _storage.delete(key: KEY_REFRESH_TOKEN);
      _storage.delete(key: KEY_REFRESH_TOKEN);
    }
    isShowNotification.value = false;
  }

  static Future<void> removePassword() async {
    _storage.delete(key: KEY_PASSWORD);
    prefs.remove(KEY_PASSWORD);
  }
}
