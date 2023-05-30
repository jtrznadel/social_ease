import 'package:flutter/material.dart';
import 'package:social_ease/constants/colors.dart';

import '../../../../../constants/sizes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline_outlined,
              ),
              labelText: "E-Mail",
            ),
          ),
          const SizedBox(
            height: tFormHeight - 15,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint_outlined,
                ),
                labelText: "Password",
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                    ))),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: tPrimaryColor),
                  onPressed: () {},
                  child: const Text("Forget Password?"))),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: tPrimaryColor),
              onPressed: () {},
              child: const Text("LOGIN"),
            ),
          )
        ],
      ),
    ));
  }
}
