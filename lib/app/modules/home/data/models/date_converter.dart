import 'package:json_annotation/json_annotation.dart';

class DateConverter implements JsonConverter<DateTime?, String> {
  const DateConverter();

  @override
  DateTime? fromJson(String? value) =>
      value != null && value.isNotEmpty ? DateTime.parse(value) : null;

  @override
  String toJson(DateTime? object) => object?.toIso8601String() ?? '';
}
