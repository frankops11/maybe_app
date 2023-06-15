import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Mi Brujita <3'),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://m.media-amazon.com/images/S/pv-target-images/720c7374f9b94dfa337e627187600ee568a1f933245c5c3fb6c3e4c8274c08c1.jpg'),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
