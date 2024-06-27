// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['_id'] as String?,
      table: json['table'] as String,
      date: DateTime.parse(json['date'] as String),
      guest: json['guest'] as String,
      guestNo: (json['guestNo'] as num).toInt(),
      time: json['time'] as String,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      '_id': instance.id,
      'guestNo': instance.guestNo,
      'date': instance.date.toIso8601String(),
      'time': instance.time,
      'table': instance.table,
      'guest': instance.guest,
    };
