import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  @JsonKey(name: '_id')
  String? id;
  final int guestNo;
  final DateTime date;
  final String time;
  final String table;
  final String guest;

  Booking({
    this.id,
    required this.table,
    required this.date,
    required this.guest,
    required this.guestNo,
    required this.time,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
