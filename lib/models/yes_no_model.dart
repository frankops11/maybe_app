import 'package:maybe_app/entities/message_entity.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  MessageEntity toMessageEntity() => MessageEntity(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.her,
      imageUrl: image);
}
