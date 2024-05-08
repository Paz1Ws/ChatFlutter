import 'package:chat_flutter/domain/entities/messages.dart';
import 'package:chat_flutter/functionality/httpYesNo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatProvider extends ChangeNotifier {
  final chatscrollController = ScrollController();
  final getAnswer = GetHttpYesNo();
  List<Message> messages = [
    Message(
      text: 'Hello',
      from: fromWho.me,
    ),
    Message(
      text: 'How are you?',
      from: fromWho.me,
    ),
    Message(
      text: 'What about you?',
      from: fromWho.me,
    ),
  ];
  Future<void> sendMessage(String message) async {
    if (message.isEmpty) {
      return;
    }
    final newMessage = Message(text: message, from: fromWho.me);
    messages.add(newMessage);
    if (message.endsWith('?')) {
      messages.add(await getAnswer.get());
    }
    moveScroll();
    notifyListeners();
  }

  Future<void> receiveMessage(String message) async {
    final newMessage = await getAnswer.get();
    moveScroll();
    notifyListeners();
  }

  void moveScroll() async {
    await Future.delayed(const Duration(milliseconds: 0));

    chatscrollController.animateTo(
        chatscrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
