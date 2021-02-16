import 'package:dio/dio.dart';
import 'package:green_drone/app/app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:green_drone/app/app_widget.dart';
import 'package:green_drone/app/modules/home/home_module.dart';
import 'package:green_drone/app/modules/splash/splash_module.dart';

import 'core/api/api_client_provider.dart';
import 'modules/vegetation_index/vegetation_index_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
        Bind((i) => ApiClientProvider(Dio()).client()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: SplashModule()),
        ModularRouter('/vegetation_index', module: VegetationIndexModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
