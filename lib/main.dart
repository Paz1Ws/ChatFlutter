import 'package:chat_flutter/chats/chat_screen.dart';
import 'package:chat_flutter/functionality/themes.dart';
import 'package:chat_flutter/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes-No-App',
        theme: AppTheme(colorIndex: 2).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
