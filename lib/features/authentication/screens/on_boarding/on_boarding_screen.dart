import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/image_strings.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/constants/text_strings.dart';
import 'package:social_ease/features/authentication/components/on_boarding_page_widget.dart';
import 'package:social_ease/features/authentication/models/model_on_boarding.dart';
import 'package:smooth';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tOnBoardingTitle1,
          subTitle: tOnBoardingSubTitle1,
          counterIndicator: "1/3",
          height: size.height,
          bgColor: tOnBoardingPage1Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage2,
          title: tOnBoardingTitle2,
          subTitle: tOnBoardingSubTitle2,
          counterIndicator: "2/3",
          height: size.height,
          bgColor: tOnBoardingPage2Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage3,
          title: tOnBoardingTitle3,
          subTitle: tOnBoardingSubTitle3,
          counterIndicator: "3/3",
          height: size.height,
          bgColor: tOnBoardingPage3Color,
        ),
      )
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: Icon(Icons.arrow_back_ios_new),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: 50.0,
              child: OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black12),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    foregroundColor: Colors.white),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: tDarkColor, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
