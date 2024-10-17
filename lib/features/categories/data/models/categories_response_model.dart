import 'package:json_annotation/json_annotation.dart';
part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  String? message;

  CategoriesResponseModel({this.message});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
