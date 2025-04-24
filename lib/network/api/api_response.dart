import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  String? status;
  String? message;
  dynamic? payload;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Response? dioResponse;

  ApiResponse({
    this.status,
    this.message,
    this.payload,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
