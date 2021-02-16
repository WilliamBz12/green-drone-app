import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:green_drone/app/shared/theme/themes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Green Drone',
      theme: AppThemes.lightTheme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
