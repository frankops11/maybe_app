enum FromWho { me, her }

class MessageEntity {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  MessageEntity({required this.text, this.imageUrl, required this.fromWho});
}
