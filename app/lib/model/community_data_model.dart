import 'dart:convert';
import 'package:app/base/const.dart';
import 'package:app/base/convert_value_2.dart';
import 'package:app/model/label_model.dart';
import 'package:app/model/note_model.dart';
import 'package:app/model/user_data_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityDataModel {
  String? id;
  String? statusEnum;
  UserData? userCreate;
  String? showpenHourse;
  String? showareaOutside;
  String? number_of_bedrooms;
  String? acreage;
  int? price;
  String? price_text;
  String? unit;
  String? cost_text;
  int? cost;
  String? unit_cost;
  String? showPrice;
  String? showCost;
  String? tick_send;
  String? showdirection;
  String? balcony_direction;
  String? showNumberBadroom;
  String? showdNumberToilet;
  String? showTile;
  String? showAcreage;
  List<String> showImaage;
  LabelModal showDasuly;
  LabelModal showlable;
  String? showaddressProduct;
  String? showDate;
  String? status;
  bool? likeStatus;
  int? totalFavorite;
  int? numberCare;
  int? user_id;
  int? numberComment;
  String? showIsCom;
  int? numberShare;
  String? phone_number_manager;
  String? department_name;
  int? department_id;
  String? project_name;
  String? floor;
  String? furniture;
  String? created_by_name;
  String? legal;
  String? code;
  String? street;
  String? procedure;
  String? showcreatedAt;
  String? apartment_location;
  String? description;
  int? is_favorite;
  int? city_id;
  int? district_id;
  String? building;
  String? number_of_rooms;
  String? label;
  int? town_id;
  int? is_com;
  int? project_id;
  String? product_type;
  LabelModal? showProDuctType;
  String? security;
  String? hoangtang;
  String? alley;
  String? createdAt;
  String? updateAt;
  String? show_date;
  String? full_name;
  String? number_of_floor;
  String? phone_number;

  String? request_type;
  List<String>? image_urls;
  List<String>? video;
  List<String>? video_360;
  List<NoteModel>? noteModel;
  UserData? source_manager;
  List<UserData>? listSaleManger;
  List<UserData>? listDirector;
  List<UserData>? listManager;

  CommunityDataModel({
    this.id,
    this.listManager,
    this.listDirector,
    this.listSaleManger,
    this.source_manager,
    this.statusEnum,
    this.city_id,
    this.cost,
    this.cost_text,
    this.department_id,
    this.video,
    this.number_of_floor,
    this.request_type,
    this.video_360,
    this.unit_cost,
    this.street,
    this.noteModel,
    this.security,
    this.updateAt,
    this.unit,
    this.is_com,
    this.price,
    this.price_text,
    this.createdAt,
    this.numberCare,
    this.is_favorite,
    this.number_of_bedrooms,
    this.status,
    this.numberComment,
    this.user_id,
    this.phone_number_manager,
    this.showDate,
    this.tick_send,
    this.numberShare,
    this.showIsCom,
    this.description,
    required this.showlable,
    this.likeStatus,
    this.totalFavorite,
    this.showNumberBadroom,
    this.showTile,
    this.product_type,
    this.full_name,
    this.showareaOutside,
    this.showaddressProduct,
    this.showCost,
    required this.showDasuly,
    this.showpenHourse,
    this.showPrice,
    this.userCreate,
    this.showdirection,
    this.phone_number,
    this.district_id,
    this.code,
    this.created_by_name,
    this.showAcreage,
    this.showdNumberToilet,
    this.department_name,
    this.project_name,
    this.image_urls,
    this.apartment_location,
    this.procedure,
    this.floor,
    this.balcony_direction,
    this.showProDuctType,
    this.hoangtang,
    this.furniture,
    this.number_of_rooms,
    this.alley,
    this.building,
    this.show_date,
    this.town_id,
    this.project_id,
    this.showcreatedAt,
    this.label,
    this.legal,
    required this.showImaage,
    this.acreage,
  });

  factory CommunityDataModel.fromJson(Map<String, dynamic> json) {
    List<String> parsedImageUrls = [];

    try{
      if (json['image_urls'] != null && json['image_urls'] is String) {
        var decoded = jsonDecode(json['image_urls']);
        if (decoded is List) {
          parsedImageUrls = List<String>.from(decoded);
        }
      }

      if (parsedImageUrls.isEmpty) {
        parsedImageUrls.add(EMPTY_AVATAR);
      }
    }catch(Erro){
      parsedImageUrls.add(EMPTY_AVATAR);
    }


    // LabelModal? lbBadroomn = FILTER_NUMBER_OF_BADROoM.firstWhereOrNull(
    //   (label) => label.value == "${json['number_of_bedrooms']}" );
    //
    LabelModal sLable = viewSHOWLABLE.firstWhere(
      (label) => label.value == json['label'],
      orElse: () => LabelModal(value: '', label: null, color: Colors.grey),
    );
    List<String> listVideo=[];
    List<String> listImage=[];
    List<String> listVImage360=[];
    try{

      listImage=json['image_urls'] != null ? List<String>.from(jsonDecode(json['image_urls'])) : [];
      listVImage360=json['video_360'] != null ? List<String>.from(jsonDecode(json['video_360'])) : [];
      listVideo=json['video'] != null ? List<String>.from(jsonDecode(json['video'])) : [];
    }
    catch(Erro){

    }

    String khoangTang = '';
    int floor = parseInt(json["floor"]);
    if (floor < 8)
      khoangTang = 'Tầng thấp';
    else if (floor >= 8 && floor < 20) {
      khoangTang = 'Tầng trung';
    } else
      khoangTang = 'Tầng cao';
     int IsCome=json['is_com'] is bool ? (json['is_com'] == true ? 1 : 0) : parseInt(json['is_com']);
    LabelModal? _dasuly= ListOfNewStatus.firstWhereOrNull( (label) => label.value =="${IsCome}",);

    return CommunityDataModel(
        showDasuly:_dasuly!=null?_dasuly:LabelModal(value: "Liên hệ",label: "Liên hệ",color: Colors.grey),
        showlable: sLable,
        label: json["label"], //SELLING', 'RENTING
        // showNumberBadroom:lbBadroomn != null? lbBadroomn.label:null,
        showNumberBadroom: json['showNumberBadroom'],
        source_manager: json['source_manager'] != null ? UserData.fromJson2(json['source_manager'], "Quản lý tin") : null,
        listSaleManger: json['listSaleManger'] != null ? (json['listSaleManger'] as List).map((i) => UserData.fromJson2(i, "Quản lý sản phẩm")).toList() : [],
        listDirector: json['listDirector'] != null ? (json['listDirector'] as List).map((i) => UserData.fromJson2(i, "Giám đốc sàn")).toList() : [],
        listManager: json['listManager'] != null ? (json['listManager'] as List).map((i) => UserData.fromJson2(i, "Quản lý tin")).toList() : [],
        id: json["id"],
        statusEnum: json["status_enum"] ?? "OPEN",
        showImaage: parsedImageUrls,
        image_urls: listImage ,
        video_360: listVImage360 ,
        video: listVideo,
        showTile: "${json["title"]}".replaceAll("null", ''),
        alley: json["alley"], // ngỏ hẻm // sổ địa chỉ
        acreage: "${json["acreage"]}", // diện tich
        price: json["price"] != null ? int.tryParse(json["price"].toString()) ?? 0 : 0,
        // price: json["price"] ,

        price_text:  json["price_text"], // giá
        unit: json["unit"] != null ? json["unit"] : null,
       cost: json["cost"] != null ? int.tryParse(json["cost"].toString()) ?? 0 : 0,

        cost_text: json["cost_text"], // giá phí
        unit_cost: json["unit_cost"] != null ? json["unit_cost"] : null,
        // //
        // showProDuctType: POST_PRODUCT.firstWhereOrNull((test) => test.value ==  json["product_type"]),
        showProDuctType:json["product_type"],
        number_of_bedrooms: json["number_of_bedrooms"] != null ? json["number_of_bedrooms"].toString() : null,
        product_type: json["product_type"], // loại bất động sản
        userCreate: UserData.fromJson(json["infoUserCreate"] ?? {}),
        showpenHourse: json["type_real_estate"], // loại hình bất động sản
        showdNumberToilet: json["number_of_wc"] != null ? '${json["number_of_wc"]}' : null, // số ngà vệ sinh
        status: json["status"].toString(), //Trạng thái: Còn hàng / Đã chốt / Tạm dừng
        // showPrice: getTextPrice(parseDouble(json["price"]), json["unit"]),
        // showCost: getTextPrice(parseDouble(json["cost"]), json["unit_cost"]),
        // showareaOutside:remoteZero(parseDouble(json["area_outside"]).toString()) ,
        // showAcreage: remoteZero(parseDouble(json["acreage"]).toString()), // diện tich
        showdirection: json["direction"], // hướng
        likeStatus: json['is_favorite'] == 1,
        // showaddressProduct: getAddress(json["city_id"] ?? 0, json["district_id"] ?? 0, json["town_id"] ?? 0,json['street']),
        totalFavorite: json['totalFavorite'],
        numberCare: json['totalFavorite'],
        building: json['building'], // tòa khu
        city_id: json['city_id'],
        department_id: json['department_id'],
        district_id: json['district_id'],
        town_id: json['town_id'],
        user_id: json['user_id'],
        full_name: json['full_name'],
        balcony_direction: json['balcony_direction'],
        createdAt: json['created_at']?? json['createdAt'],
        updateAt: json['updated_at'],
        tick_send: json['tick_send'] != null ? json['tick_send'].toString() : null,
        number_of_rooms: json['number_of_rooms'], // số căn
        numberComment: json['totalComment'],
        numberShare: json['totalShare'],
        show_date: json['show_date'],
        is_com: IsCome,
        showIsCom: (json['is_com'] == 1 || json['is_com'] == true) ? "Đã xử lý" : "Chưa xử lý",
        showDate: renderTime(json['created_at']),
        phone_number_manager: json['phone_number_manager'],
        department_name: json['department_name'],
        is_favorite: json['is_favorite'],
        number_of_floor: json['number_of_floor'] != null ? json['number_of_floor'] : "0", // số tầng
        apartment_location: json['apartment_location'], // vị trí
        floor: json['floor'], // tầng dãy
        hoangtang: khoangTang, // khoảng tầng
        street: json['street'], // sô đường phố
        legal: json['legal'], // giấy tờ pháp lý
        code: json['code'], // mã căn hộ
        description: json['description'],
        phone_number: json['phone_number'],
        project_id: parseInt(json['project_id']) ,
        procedure: json['procedure'], // phi giao dich
        created_by_name: json['created_by_name'],
        security: json['security'], //Bảo mật thông tin: Tin bảo mật / Tin kết hợp / Tin chính chủ
        project_name:  (json['project_name']!="null" && json['project_name']!=null)?json['project_name']:"Liên hệ",
        furniture: json['furniture'], // nội thất
        noteModel: json['note_product'] != null ? (json['note_product'] as List).map((i) => NoteModel.fromJson(i)).toList() : null,
        showcreatedAt: formatStringToDateVN(json['created_at']??json['createdAt'], "dd-MM-yyyy HH:mm'")
    );
  }
}

class ListComunityModal {
  List<CommunityDataModel>? data;

  ListComunityModal({
    this.data,
  });

  factory ListComunityModal.fromJson(List<dynamic> json) {
    return ListComunityModal(
      data: json != null ? (json).map((i) => CommunityDataModel.fromJson(i)).toList() : null,
    );
  }
}
