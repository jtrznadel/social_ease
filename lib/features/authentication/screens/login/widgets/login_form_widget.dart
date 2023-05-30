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
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "E-Mail",
                hintText: "E-Mail",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: tDefaultSize - 15,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint_outlined),
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_outlined))),
          ),
          const SizedBox(
            height: tDefaultSize - 20,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: tPrimaryColor),
                  onPressed: () {},
                  child: Text("Forget Password?"))),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: tPrimaryColor),
              onPressed: () {},
              child: Text("LOGIN"),
            ),
          )
        ],
      ),
    ));
  }
}
