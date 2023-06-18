import 'package:flutter/material.dart';
import 'package:maybe_app/entities/message_entity.dart';
import 'package:maybe_app/providers/chat_provider.dart';
import 'package:maybe_app/widgets/chat_header.dart';
import 'package:maybe_app/widgets/her_bubble_message.dart';
import 'package:maybe_app/widgets/me_bubble_message.dart';
import 'package:maybe_app/widgets/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return Scaffold(
        appBar: const ChatHeader(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.her)
                      ? HerBubbleMessage(
                          message: message,
                        )
                      : MeBubbleMessage(
                          message: message,
                        );
                },
              )),
              MessageFieldBox(
                // onValueChanged: (value) => chatProvider.sendMessage(value),
                onValueChanged: chatProvider.sendMessage,
              )
            ],
          ),
        )));
  }
}
