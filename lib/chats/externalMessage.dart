import 'package:chat_flutter/domain/entities/messages.dart';
import 'package:flutter/material.dart';

class ExternalMessageBubble extends StatelessWidget {
  final Message message;

  const ExternalMessageBubble({Key? key, required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      imageBubble(message: message),
    ]);
  }
}

class imageBubble extends StatelessWidget {
  final Message message;

  const imageBubble({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Image.network(
          message.imageURL.toString(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
