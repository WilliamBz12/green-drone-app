import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:green_drone/app/modules/vegetation_index/repositories/tgi_repository.dart';
import 'package:green_drone/app/shared/models/url_image_model.dart';

class VegetationIndexService {
  TgiRepository tgiRepository;
  VegetationIndexService({this.tgiRepository});

  Future<Either<String, UrlImageModel>> sendImage({File image}) async {
    try {
      if (image == null) return Left("Error");

      final result = await tgiRepository.fetchTGIImage(image: image);

      return Right(UrlImageModel(address: result));
    } catch (e) {
      return Left(e);
    }
  }
}
