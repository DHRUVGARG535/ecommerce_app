import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.animation,
    required this.title,
    required this.subTitle,
  });

  final String animation;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(
       
        top: USizes.appBarHeight,
      ),
      child: Column(
        children: [
          Lottie.asset(animation),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          Text(subTitle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
