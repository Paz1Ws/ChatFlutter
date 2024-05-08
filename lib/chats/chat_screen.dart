import 'package:chat_flutter/domain/entities/messages.dart';
import 'package:chat_flutter/chats/bubbleMessage.dart';
import 'package:chat_flutter/chats/externalMessage.dart';
import 'package:chat_flutter/functionality/messageBox.dart';
import 'package:chat_flutter/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChatScreen());
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://intelligence.house.gov/uploadedphotos/mediumresolution/322ab1ed-eeb4-4782-945b-e6fac08fb3b5.jpg'),
            ),
          ),
          title: Text('President'),
        ),
        body: _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatscrollController,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      return (message.from == fromWho.me)
                          ? MyMessageBubble(
                              message: message,
                            )
                          : ExternalMessageBubble(
                              message: message,
                            );
                    }),
              ),
              messageBox(
                onSend: chatProvider.sendMessage,
              ),
            ],
          )),
    );
  }
}
