import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/image_strings.dart';
import 'package:social_ease/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(pages: [
            Container(
              padding: const EdgeInsets.all(10),
              color: tOnBoardingPage1Color,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(tOnBoardingImage1),
                      height: size.height * 0.5,
                    ),
                    Column(
                      children: [
                        Text(
                          tOnBoardingTitle1,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          tOnBoardingSubTitle1,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ]),
            ),
            Container(
              color: tOnBoardingPage2Color,
              child: Column(
                children: [
                  Image(image: AssetImage(tOnBoardingImage1)),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
