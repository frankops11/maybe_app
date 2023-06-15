import 'package:flutter/material.dart';
import 'package:maybe_app/widgets/bubble_message.dart';
import 'package:maybe_app/widgets/chat_header.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ChatHeader(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return const BubbleMessage();
                },
              ))
            ],
          ),
        )));
  }
}
