import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String title;
  final String detail;
  final DateTime date;
  final String time;
  final String image;

  const Event(
      {required this.date,
      required this.detail,
      required this.time,
      required this.image,
      required this.title});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}






/*

"title": "Raangin Rat",
            "detail": "Name padayera aafai bujha",
            "date": "2024-06-16T00:00:00.000Z",
            "time": "14:30:00",
            "image": "/public/images/events/1718536156427.png",


*/