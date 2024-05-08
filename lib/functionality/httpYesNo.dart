import 'package:chat_flutter/chats/infrastructure/models/YesNoModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/domain/entities/messages.dart';

class GetHttpYesNo {
  final dio = Dio();

  Future<Message> get() async {
    final response = await dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessage();
  }
}
