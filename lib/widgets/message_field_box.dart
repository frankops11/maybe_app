import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValueChanged;

  const MessageFieldBox({required this.onValueChanged, super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final color = Theme.of(context).colorScheme;

    final outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: color.primary),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_rounded),
          onPressed: () {
            final texValue = textController.value.text;
            textController.clear();
            onValueChanged(texValue);
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: inputDecoration,
      controller: textController,
      onFieldSubmitted: (value) {
        onValueChanged(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
