
import 'package:equatable/equatable.dart';

class CodeName extends Equatable {
  String code;
  String name;

  CodeName(this.code, this.name);

  @override
  List<Object?> get props => [code, name];
}