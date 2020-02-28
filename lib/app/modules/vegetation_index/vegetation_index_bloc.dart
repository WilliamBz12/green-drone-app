import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_service.dart';
import 'package:green_drone/app/shared/services/select_image_service.dart';
import 'package:rxdart/rxdart.dart';

class VegetationIndexBloc extends BlocBase {
  SelectImageService selectImageService;
  VegetationIndexService vegetationIndexService;

  VegetationIndexBloc({this.selectImageService, this.vegetationIndexService});

  final _imageController = BehaviorSubject<File>();
  Stream<File> get outImage => _imageController.stream;

  Stream<bool> get outStateButton =>
      _imageController.stream.map((file) => file != null);

  final _urlController = BehaviorSubject<String>();
  Stream<String> get urlImage => _urlController.stream;

  void selectImageFromCamera() async {
    final result = await selectImageService.fetchFromCamera();
    result.fold(
      (error) => _imageController.addError(error),
      (image) => _imageController.add(image),
    );
  }

  void selectImageFromGallery() async {
    final result = await selectImageService.fetchFromGallery();
    result.fold(
      (error) => _imageController.addError(error),
      (image) => _imageController.add(image),
    );
  }

  Future<bool> sendImage() async {
    final result = await vegetationIndexService.sendImage(
      image: _imageController.value,
    );
    
    result.fold(
      (error) => _urlController.addError(error),
      (urlImage) => _urlController.add(urlImage.url),
    );

    return result.isRight();
  }

  @override
  void dispose() {
    super.dispose();
    _imageController.close();
  }
}
