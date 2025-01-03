import 'dart:convert';

import 'package:app/base/convert_value_2.dart';
import 'package:app/model/department_model.dart';



class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  int? providerId;
  int? status;
  bool? is_active;
  int? totalBooking;

  ///check its use
  String? description;
  String? knownLanguages;
  String? whyChooseMe;
  String? skills;
  String? userType;
  String? email;
  String? contactNumber;
  int? countryId;
  int? stateId;
  int? cityId;
  String? cityName;
  List<String>? sub_roles;
  String? address;
  String? providerTypeId;
  String? providerType;
  int? isFeatured;
  String? displayName;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? timeZone;
  String? lastNotificationSeen;
  String? uid;
  String? socialImage;
  String? loginType;
  int? serviceAddressId;
  num? providersServiceRating;
  num? handymanRating;
  int? isVerifyProvider;
  String? designation;
  String? apiToken;
  String? emailVerifiedAt;
  List<String>? userRole;
  int? isUserExist;
  String? password;
  String? role;
  String? dob;
  String? full_name;
  num? isFavourite;
  String? rank_core;
  String? department_name;

  String? verificationId;
  String? otpCode;

  bool isSelected = false;
  int? isOnline;
  String? createdAtNEW;
  int? emailVerified;
  int? department_id;
  String? url_avatar;
  String? gender;
  Department? department;

  String? rank;
  String? rePassword;
  String? sub_role_name;
  bool? checkAccept = false;

  UserData({
    this.address,
    this.checkAccept,
    this.rePassword,
    this.department_name,
    this.rank,
    this.department,
    this.department_id,
    this.apiToken,
    this.cityId,
    this.contactNumber,
    this.countryId,
    this.createdAt,
    this.displayName,
    this.is_active,
    this.socialImage,
    this.email,
    this.emailVerifiedAt,
    this.firstName,
    this.id,
    this.isFeatured,
    this.lastName,
    this.description,
    this.knownLanguages,
    this.whyChooseMe,
    this.skills,
    this.providerType,
    this.cityName,
    this.providerId,
    this.providerTypeId,
    this.stateId,
    this.status,
    this.sub_roles,
    this.updatedAt,
    this.userRole,
    this.role,
    this.userType,
    this.username,
    this.profileImage,
    this.uid,
    this.handymanRating,
    this.lastNotificationSeen,
    this.createdAtNEW,
    this.loginType,
    this.providersServiceRating,
    this.serviceAddressId,
    this.timeZone,
    this.sub_role_name,
    this.isOnline,
    this.rank_core,
    this.isVerifyProvider,
    this.isUserExist,
    this.password,
    this.isFavourite,
    this.designation,
    this.dob,
    this.verificationId,
    this.otpCode,
    this.totalBooking,
    this.emailVerified,
    this.url_avatar,
    this.full_name,
    this.gender,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'] ?? 0,
        email: json['email'] ?? '',
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
        full_name: json['full_name'] ?? "",
        role: json['role'] ?? '',
        // "dob": "1993-05-28T17:00:00.000Z",
        contactNumber: json['phone_number'] ?? '',
        dob: json['dob'] ?? '',
        url_avatar: json['url_avatar'] ?? '',
        gender: json['gender'] ?? '',
        rank: renderRank(json['rank'] ?? "00000"),
        rank_core: json['rank'],
        address: json['address'],
        department_name: json['department_name'],
        apiToken: json['api_token'],
        sub_roles: json['sub_roles'] != null ? (json['sub_roles'] is String ? List<String>.from(jsonDecode(json['sub_roles'])) : List<String>.from(json['sub_roles'])) : [],
        is_active: json['is_active'],
        sub_role_name: json['sub_role_name'],
        cityId: json['city_id'] ?? 0,
        countryId: json['country_id'] ?? 0,
        createdAt: json['created_at'],
        createdAtNEW: json['createdAt'],
        displayName: json['full_name'] ?? "",
        department_id: json["department_id"] ?? 33,
        department: json["department"] != null ? Department.fromJson(json["department"]) : null);
  }

  factory UserData.fromJson2(Map<String, dynamic> json, String title) {
    return UserData(
      lastName: title,
      displayName: json['full_name'] ?? "",
      contactNumber: json['phone_number'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User data{ id: $id, email: $email}';
  }
}

class ListUserModel {
  List<UserData>? data;
  int? total;

  ListUserModel({this.data, this.total});

  factory ListUserModel.fromJson(Map<String, dynamic> json) {
    return ListUserModel(data: json['data'] != null ? (json['data'] as List).map((i) => UserData.fromJson(i)).toList() : null, total: json['total']);
  }
}

class quanlyModel {
  int? id;
  int? user_id;
  UserData? user;

  quanlyModel({this.id, this.user, this.user_id});
  factory quanlyModel.fromJson(Map<String, dynamic> json) {
    return quanlyModel(
      id: json['id'] ?? 0,
      user_id: json['user_id'] ?? 0,
      user: UserData.fromJson(json['user']),
    );
  }
}

class ListUserquanlyModel {
  List<quanlyModel>? data;
  int? total;

  ListUserquanlyModel({this.data, this.total});

  factory ListUserquanlyModel.fromJson(Map<String, dynamic> json) {
    return ListUserquanlyModel(data: json['data'] != null ? (json['data'] as List).map((i) => quanlyModel.fromJson(i)).toList() : null, total: json['total']);
  }
}
