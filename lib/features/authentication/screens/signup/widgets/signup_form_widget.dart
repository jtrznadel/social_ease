import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../login/login_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 15),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              decoration: const InputDecoration(
                  label: Text("Username"),
                  prefixIcon: Icon(Icons.person_outline_outlined))),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
              decoration: const InputDecoration(
                  label: Text("E-Mail"),
                  prefixIcon: Icon(Icons.email_outlined))),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
              decoration: const InputDecoration(
                  label: Text("Phone Number"), prefixIcon: Icon(Icons.phone))),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
              decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.fingerprint_outlined),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined))),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
              decoration: const InputDecoration(
                  label: Text("Confirm Password"),
                  prefixIcon: Icon(Icons.fingerprint_outlined),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined))),
          const SizedBox(
            height: tFormHeight - 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                child: const Text("Sign Up")),
          )
        ],
      )),
    );
  }
}
