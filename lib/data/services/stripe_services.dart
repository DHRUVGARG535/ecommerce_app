// import 'package:dio/dio.dart' as dio;
// import 'package:ecommerce_app/utils/constants/apis.dart';
// import 'package:ecommerce_app/utils/constants/key.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';

// class StripeServices extends GetxController {
//   static StripeServices get instance => Get.find();

//   ///variables
//   final _dio = dio.Dio();

//   Future<dynamic> createPaymentIntent(String currency, int amount) async {
//     try {
//       String url = UApiUrls.stripeCreateIntents;

//       final data = {
//         'currency': currency,
//         'amount': amount * 100,
//         'payment_method_types[]': 'card',
//       };

//       dio.Response response = await _dio.post(
//         url,
//         data: data,
//         options: dio.Options(
//           headers: {
//             'Authorization': 'Bearer ${UKeys.stripeSecretKey}',
//             'Content-Type': 'application/x-www-form-urlencoded',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         return response.data;
//       }
//     } catch (e) {
//       throw "Something went wrong while creating payment intents";
//     }
//   }

//   Future<void> initPaymentSheet(String currency, int amount) async {
//     try {
//       // 1. Create payment intent on the server
//       final data = await createPaymentIntent(currency, amount);

//       // 3. Initialize the payment sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           customFlow: false,
//           // Main params
//           paymentIntentClientSecret: data['client_secret'],
//           merchantDisplayName: 'Dhruv Store App',
//           // Customer params

//           // Return URL for redirect-based payment methods
//           // returnURL: 'flutterstripe://redirect',
//           // Extra options
//           // primaryButtonLabel: 'Pay now',
//           // applePay: PaymentSheetApplePay(
//           //   merchantCountryCode: 'US',
//           // ),
//           googlePay: PaymentSheetGooglePay(
//             merchantCountryCode: 'US',
//             testEnv: true,
//           ),
//           style: ThemeMode.dark,
//         ),
//       );
//     } catch (e) {
//       throw "Something went wrong while initializing the payment sheet";
//     }
//   }

//   Future<void> showPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//     } on StripeException catch (e) {
//       switch (e.error.code) {
//         case FailureCode.Canceled:
//           throw 'Payment canceled';
//         case FailureCode.Failed:
//           throw 'Payment Failed';
//         case FailureCode.Timeout:
//           throw 'Payment Timedout';
//         case FailureCode.Unknown:
//           throw 'Unkown error occured';
//       }
//     } catch (e) {
//       throw 'Something went wrong while showing payment sheet ';
//     }
//   }


// }
