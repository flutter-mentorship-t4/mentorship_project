import 'package:json_annotation/json_annotation.dart';
part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  String? message;

  CartResponseModel({this.message});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);
}
