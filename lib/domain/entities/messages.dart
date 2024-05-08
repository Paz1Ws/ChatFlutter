import 'package:flutter/material.dart';

enum fromWho { me, other }

class Message {
  final String text;
  final fromWho from;
  final String? imageURL;
  Message({required this.text, required this.from, this.imageURL});
}
