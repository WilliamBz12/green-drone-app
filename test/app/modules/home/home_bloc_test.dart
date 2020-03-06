import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_drone/app/modules/home/home_bloc.dart';
import 'package:green_drone/app/modules/home/home_module.dart';


void main() {

  initModule(HomeModule());
  HomeBloc bloc;

  setUp(() {
    bloc = HomeModule.to.get<HomeBloc>();
  });

  group('HomeBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<HomeBloc>());
    });
  });
}
