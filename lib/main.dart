import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/my_app.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  Stripe.publishableKey = UKeys.stripePublishableKey;


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository());
  });

  final user = AuthenticationRepository.instance.currentUser;

  if (user != null) {
    await GetStorage.init(user.uid);
  } else {
    await GetStorage.init();
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}
