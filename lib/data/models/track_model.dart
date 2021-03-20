
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
class TrackModel extends Equatable {
  final String artist_name;
  final String album_name;
  final String url;
  final String image;

  TrackModel({
    @required this.url,
    @required this.album_name,
    @required this.artist_name,
    @required this.image
  });
  @override
  // TODO: implement props
  List<Object> get props => [artist_name,album_name,url,image];

  factory TrackModel.fromJson(Map<String, dynamic>json){
    return TrackModel(
      album_name: json['albumName'],
      artist_name: json['artistName'],
      url: json['previewURL'],
      image: "http://direct.rhapsody.com/imageserver/v2/albums/${json['albumId']}/images/300x300.jpg"
    );
  }

  factory TrackModel.toJson(String jsonString){
    return json.decode(jsonString);
  }


}