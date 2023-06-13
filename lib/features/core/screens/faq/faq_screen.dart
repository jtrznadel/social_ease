import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/text_strings.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Accordion(
              maxOpenSections: 2,
              headerBackgroundColorOpened: tPrimaryColor,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerBackgroundColor: tPrimaryColor.withOpacity(0.5),
              contentBorderColor: tPrimaryColor,
              headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              children: [
                AccordionSection(
                  header: const Text(tFAQQuestion1),
                  content: const Text(tFAQAnswer1),
                ),
                AccordionSection(
                  header: const Text(tFAQQuestion2),
                  content: const Text(tFAQAnswer2),
                ),
                AccordionSection(
                  header: const Text(tFAQQuestion3),
                  content: const Text(tFAQAnswer3),
                ),
                AccordionSection(
                  header: const Text(tFAQQuestion4),
                  content: const Text(tFAQAnswer4),
                ),
                AccordionSection(
                  header: const Text(tFAQQuestion5),
                  content: const Text(tFAQAnswer5),
                ),
                AccordionSection(
                  header: const Text(tFAQQuestion6),
                  content: const Text(tFAQAnswer6),
                ),
              ])
        ],
      )),
    );
  }
}
