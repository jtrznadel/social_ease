import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tDefaultSize - 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                tGoogleLogo,
                height: 18,
              ),
              style: OutlinedButton.styleFrom(foregroundColor: tPrimaryColor),
              label: const Text("SIGN-IN WITH GOOGLE")),
        ),
        TextButton(
            onPressed: () => Get.to(() => const LoginScreen()),
            child: Text.rich(TextSpan(
                text: "Already have an Account? ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                      text: "Login now",
                      style: Theme.of(context).textTheme.titleMedium)
                ])))
      ],
    );
  }
}
