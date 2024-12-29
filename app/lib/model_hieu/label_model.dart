import 'package:flutter/material.dart';

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