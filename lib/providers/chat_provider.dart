import 'package:flutter/material.dart';
import 'package:maybe_app/entities/message_entity.dart';
import 'package:maybe_app/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<MessageEntity> messageList = [
    MessageEntity(text: 'Hola amor!', fromWho: FromWho.me),
    MessageEntity(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = MessageEntity(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await getHerReply();
    }

    notifyListeners();
    moveScrollTopBottom();
  }

  Future<void> getHerReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
  }

  Future<void> moveScrollTopBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }
}
