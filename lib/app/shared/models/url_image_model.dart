import 'package:green_drone/app/core/constants/constants.dart';

class UrlImageModel {
  String url;
  UrlImageModel({String address}) : url = "${Constants.url}/$address";
}
