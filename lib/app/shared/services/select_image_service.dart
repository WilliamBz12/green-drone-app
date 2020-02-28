import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

class SelectImageService {
  Future<Either<String, File>> fetchFromGallery() async {
    try {

      final image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 480,
        maxHeight: 600,
      );

      if (image == null) return Left("Imagem não existe");

      return Right(image);
    } on FileSystemException {
      return Left("Erro ao selecionar pela galeria");
    }
  }

  Future<Either<String, File>> fetchFromCamera() async {
    try {
      
      final image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 480,
        maxHeight: 600,
      );

      if (image == null) return Left("Imagem não existe");

      return Right(image);
    } on FileSystemException {
      return Left("Erro ao enviar pela camera");
    }
  }
}
