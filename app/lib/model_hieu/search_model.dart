import 'package:flutter/material.dart';


class Searchmodel {
  LabelModal? slectCatogory;
  String? stringSearch;

  List<LabelModal>? selectedItemOrder = [];
  List<LabelModal>? selectedItemPrice = [];
  List<LabelModal>? selecteddirection = [];
  List<AddresModel>? ListCheckCity = [];
  List<AddresModel>? ListCheckDistrict = [];
  List<AddresModel>? lListCheckTowns = [];
  List<LabelModal>? selectedStatus = [];
  List<LabelModal>? selectTypeProduct = [];
  List<LabelModal>? selectedLoaiProduct = [];
  List<RangeValues>? selectedAcreage = [];
  List<RangeValues>? selectedAcreagefont = [];
  List<LabelModal>? selectedinterior = [];
  List<LabelModal>? selectednumberoffloors = [];
  List<LabelModal>? selectedNumberofbedrooms = [];
  List<LabelModal>? selectedLocation = [];

  Searchmodel({
    this.slectCatogory,
    this.stringSearch,
    this.selectedItemOrder,
    this.selectedItemPrice,
    this.ListCheckCity,
    this.ListCheckDistrict,
    this.lListCheckTowns,
    this.selectedStatus,
    this.selectTypeProduct,
    this.selectedLoaiProduct,
    this.selectedAcreage,
    this.selectedAcreagefont,
    this.selectedinterior,
    this.selectednumberoffloors,
    this.selectedNumberofbedrooms,
    this.selectedLocation,
    this.selecteddirection,

  });
}



class LabelModal {
  String? label;
  String? value;
  String? orderBy;
  String? from;
  Color? color;
  String? to;
  double? m2from;
  double? m2to;
  String? title;
  double? width;
  String? titleProject;
  String? Screen;
  int? city_id;
  int? number_of_products;

  LabelModal(
      {this.m2from,
      this.color,
      this.city_id,
      this.number_of_products,
      this.titleProject,
      this.title,
      this.width,
      this.m2to,
      this.label,
      this.Screen,
      this.from,
      this.to,
      this.orderBy,
      required this.value});

  factory LabelModal.fromJson(Map<String, dynamic> json) {
    return LabelModal(
      value: 'ds',
      city_id: json["city_id"],
      number_of_products: json["number_of_products"],
      label: json["city_name"],
    );
  }

  @override
  String toString() {
    return '$label';
  }
}

class ListKhuvucModal {
  int count = 0;
  List<LabelModal>? data;
  ListKhuvucModal({this.data, this.count=0});

  factory ListKhuvucModal.fromJson(Map<String, dynamic> json) {
    return ListKhuvucModal(
      count: json["count"] ?? 0,
      data: json['result'] != null ? (json['result'] as List).map((i) => LabelModal.fromJson(i)).toList() : [],
    );
  }

  @override
  String toString() {
    return 'ListProjectModal{data: $data}';
  }
}


class AddresModel {
  int? id;
  String? name;
  String? slug;
  String? code;
  String? parent_code;
  bool? statusCheck =false;

  AddresModel({this.id, this.name, this.slug, this.code, this.parent_code, this.statusCheck});

  factory AddresModel.fromJson(Map<String, dynamic> json) {
    return AddresModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      code: json['code'],
      parent_code: json['parent_code'],
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, slug: $slug, code: $code, parent_code: $parent_code}';
  }
}

class ListAddresModel {
  List<AddresModel>? data;

  ListAddresModel({this.data});

  factory ListAddresModel.fromJson(List<dynamic> json) {
    return ListAddresModel(
      data: json != null ? (json as List).map((i) => AddresModel.fromJson(i)).toList() : null,
    );
  }

  @override
  String toString() {
    return 'ListAddresModel{data: $data}';
  }

  static ListAddresModel? fromJsonList(List listCity) {}
}
