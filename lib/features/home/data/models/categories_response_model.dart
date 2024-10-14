import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  final List<String> categories;

  CategoriesResponseModel({required this.categories});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
