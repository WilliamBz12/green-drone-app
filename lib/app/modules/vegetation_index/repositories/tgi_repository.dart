import 'dart:io';

import 'package:dio/dio.dart';

class TgiRepository {
  final Dio dio;
  TgiRepository({this.dio});

  Future<String> fetchTGIImage({File image}) async {
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: fileName),
    });
    final response = await dio.post(
      "/api/tgi-upload",
      data: formData,
    );

    if (response.statusCode != 200) throw HttpException(response.statusMessage);

    return response.data;
  }

}
