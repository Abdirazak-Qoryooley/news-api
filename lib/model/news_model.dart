import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class newsmodel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  newsmodel(
      {this.author = '',
      this.title = '',
      this.description = '',
      this.url = '',
      this.urlToImage = '',
      this.publishedAt = '',
      this.content = ''});
  factory newsmodel.fromJson(Map<String, dynamic> json) =>
      _$newsmodelFromJson(json);
  Map<String, dynamic> toJson() => _$newsmodelToJson(this);
}
