import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/common_widgets/form/form_header_widget.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/constants/text_strings.dart';
import 'package:social_ease/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:social_ease/features/authentication/screens/signup/widgets/signup_form_widget.dart';

import '../../../../constants/image_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FormHeaderWidget(
              image: tWelcomeImage,
              title: tSignUpTitle,
              subTitle: tSignUpSubTitle,
              imageScale: 0.1,
            ),
            SignUpFormWidget(),
            SignUpFooterWidget()
          ]),
        ),
      ),
    );
  }
}
