import 'package:app/base/convert_value_2.dart';
import 'package:app/model/user_data_model.dart';

class NoteModel {
  String? date;
  UserData userData;
  String? note;
  String? type;
  String? full_name;

  NoteModel({required this.date, required this.userData, required this.note, this.type, this.full_name});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      date: formatStringToDate(json["createdAt"], "(HH:mm) dd/MM/yyyy "),
      userData: new UserData(displayName: json["full_name"]),
      note: json["note"],
      type: json["type"],
      full_name: json["full_name"],
    );
  }
}




