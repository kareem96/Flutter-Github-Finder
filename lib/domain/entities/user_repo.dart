


import 'package:equatable/equatable.dart';

class Repo extends Equatable{
  int id;
  String? name;
  String? description;
  String? language;

  Repo({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
  });

  @override
  List<Object?> get props => [id, name, description, language];


}