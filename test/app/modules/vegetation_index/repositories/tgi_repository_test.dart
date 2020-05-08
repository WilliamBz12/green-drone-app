import 'package:flutter_test/flutter_test.dart';
import 'package:green_drone/app/modules/vegetation_index/repositories/tgi_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class MockClient extends Mock implements Dio {}

void main() {
  TgiRepository repository;
  MockClient client;

  setUp(() {
    repository = TgiRepository();
    client = MockClient();
  });

  group('TgiRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<TgiRepository>());
    });


  });
}
