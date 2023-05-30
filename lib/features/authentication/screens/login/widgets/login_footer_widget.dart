import 'package:flutter/material.dart';
import 'package:social_ease/constants/colors.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(
          height: tDefaultSize - 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                tGoogleLogo,
                height: 20,
              ),
              style: OutlinedButton.styleFrom(foregroundColor: tPrimaryColor),
              label: Text("Sign-In with Google")),
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: "Don't have an Account? ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                      text: "SignUp",
                      style: Theme.of(context).textTheme.titleMedium)
                ])))
      ],
    );
  }
}
