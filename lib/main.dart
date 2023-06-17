import 'package:flutter/material.dart';
import 'package:maybe_app/providers/chat_provider.dart';
import 'package:maybe_app/screens/chat_screen.dart';
import 'package:maybe_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maybe App',
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
