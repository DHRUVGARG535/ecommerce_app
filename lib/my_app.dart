import 'package:ecommerce_app/bindings/bindings.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      getPages: UAppRoutes.screens,
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,
      initialBinding: UBindings(),
      home: const Scaffold(
        body: Center(child: CircularProgressIndicator(color: UColors.primary)),
      ),
    );
  }
}
