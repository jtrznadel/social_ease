import 'package:flutter/material.dart';
import 'package:social_ease/common_widgets/form/form_header_widget.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/constants/text_strings.dart';
import 'package:social_ease/features/authentication/screens/signup/widgets/signup_form_widget.dart';

import '../../../../constants/image_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormHeaderWidget(
                      image: tWelcomeImage,
                      title: tSignUpTitle,
                      subTitle: tSignUpSubTitle),
                  SignUpFormWidget(),
                ]),
          ),
        ),
      ),
    );
  }
}
