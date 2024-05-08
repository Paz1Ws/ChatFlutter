import 'dart:convert';

import 'package:chat_flutter/domain/entities/messages.dart';

YesNoModel yesNoModelFromJson(String str) =>
    YesNoModel.fromJson(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMessage() {
    return Message(
      text: answer == 'yes' ? 'Yes' : 'No',
      from: fromWho.other,
      imageURL: image,
    );
  }
}
