// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      date: DateTime.parse(json['date'] as String),
      detail: json['detail'] as String,
      time: json['time'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'date': instance.date.toIso8601String(),
      'time': instance.time,
      'image': instance.image,
    };
