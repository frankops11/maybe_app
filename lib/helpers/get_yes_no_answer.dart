import 'package:dio/dio.dart';
import 'package:maybe_app/entities/message_entity.dart';
import 'package:maybe_app/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<MessageEntity> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
  }
}
