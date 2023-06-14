import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_ease/features/authentication/controllers/on_boarding_controller.dart';
import 'package:social_ease/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:social_ease/features/core/screens/faq/faq_screen.dart';

//ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangeCallback,
            pages: obController.pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios_new),
            enableSideReveal: true,
          ),
          Obx(() {
            if (obController.currentPage.value == 2) {
              return const MoveToWelcomeButton();
            } else {
              return Container();
            }
          }),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obController.skip(),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () => Get.to(() => const FaqScreen()),
              icon: const Icon(Icons.help_outline_rounded),
              iconSize: 30,
            ),
          ),
          Obx(
            () => Positioned(
                bottom: 12.0,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: 3,
                  effect:
                      const WormEffect(activeDotColor: Colors.black87, dotHeight: 7.0),
                )),
          ),
        ],
      ),
    );
  }
}

class MoveToWelcomeButton extends StatelessWidget {
  const MoveToWelcomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50.0,
        child: OutlinedButton(
          onPressed: () => Get.to(() => const WelcomeScreen()),
          style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.black12),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              foregroundColor: Colors.white),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration:
                const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ));
  }
}
