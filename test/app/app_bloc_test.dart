import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_drone/app/app_bloc.dart';
import 'package:green_drone/app/app_module.dart';


void main() {
  initModule(AppModule());
  AppBloc bloc;

  setUp(() {
    bloc = AppModule.to.get<AppBloc>();
  });

  group('AppBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<AppBloc>());
    });
  });
}
