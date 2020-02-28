import 'package:flutter_modular/flutter_modular.dart';
import 'package:green_drone/app/modules/vegetation_index/pages/image_color_picker_page.dart';
import 'package:green_drone/app/modules/vegetation_index/pages/image_page.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_page.dart';
import 'package:green_drone/app/modules/vegetation_index/vegetation_index_service.dart';
import 'package:green_drone/app/shared/services/select_image_service.dart';

import '../../app_module.dart';
import 'repositories/tgi_repository.dart';
import 'vegetation_index_bloc.dart';

class VegetationIndexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SelectImageService()),
        Bind((i) => TgiRepository(dio: AppModule.to.get())),
        Bind((i) => VegetationIndexService(tgiRepository: i.get())),
        Bind((i) => VegetationIndexBloc(
              selectImageService: i.get(),
              vegetationIndexService: i.get(),
            )),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => VegetationIndexPage()),
        Router('/image-page', child: (_, args) => ImagePage()),
        Router('/image-picker', child: (_, args) => ColorPickerWidget()),
      ];

  static Inject get to => Inject<VegetationIndexModule>.of();
}
