import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_bloc.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_module.dart';
import 'package:green_drone/app/shared/services/select_image_service.dart';


import 'package:mockito/mockito.dart';

class MockImageService extends Mock implements SelectImageService {}

void main() {
  initModule(VegetationIndexModule());
  VegetationIndexBloc bloc;
  MockImageService mockImageService;

  setUp(() {
    mockImageService = MockImageService();
    bloc = VegetationIndexBloc(selectImageService: mockImageService);
  });

  group('VegetationIndexBloc Test', () {
    final _errorCamera = "Erro ao pegar pela camera";
    final _errorGallery = "Erro ao pegar pela galeria";


    test(
      "Should emits error when service return Left Side error in select from camera",
      () async {
        when(mockImageService.fetchFromCamera())
            .thenAnswer((_) async => Left(_errorCamera));

        bloc.selectImageFromCamera();

        expect(bloc.outImage, emitsError(_errorCamera));
      },
    );

    test(
      "Should emits error when service return Left Side error in select from gallery",
      () async {
        when(mockImageService.fetchFromGallery())
            .thenAnswer((_) async => Left(_errorGallery));

        bloc.selectImageFromGallery();

        expect(bloc.outImage, emitsError(_errorGallery));
      },
    );

  });
}
