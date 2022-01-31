


import 'package:equatable/equatable.dart';
import 'package:github_finder/domain/entities/user_repo.dart';

class RepoModel extends Equatable{
  final int id;
  final String? name;
  final String? description;
  final String? language;
  const RepoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
    id: json['id'] ,
    name: json['name'] ,
    description: json['description'],
    language: json['language'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'language': language,
  };

  Repo toEntity(){
    return Repo(
        id: id,
        name: name,
        description: description,
        language: language,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    description,
    language,
  ];
}