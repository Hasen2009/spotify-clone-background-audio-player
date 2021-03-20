import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';


class PlaylistModel extends Equatable{
  final String name;
  final String image;
  final String description;
  final String playlist_id;

  PlaylistModel({
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.playlist_id
  });

  @override

  List<Object> get props => [name,image,description,playlist_id];

  factory PlaylistModel.fromJson(Map<String, dynamic> json){
    return PlaylistModel(
      name: json['name'],
      description:  json['description'],
      image: json['images'][0]['url'],
      playlist_id: json['id']
    );

  }

  factory PlaylistModel.toJson(String jsonString){
    return json.decode(jsonString);
  }

}