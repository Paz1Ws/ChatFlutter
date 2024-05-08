import 'package:chat_flutter/domain/entities/messages.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/main.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
        width: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            message.text,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }
}
