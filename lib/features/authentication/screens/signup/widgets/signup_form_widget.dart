import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/features/authentication/controllers/signup_controller.dart';
import 'package:social_ease/models/user_model.dart';

import '../../../../../constants/sizes.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.username,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username.';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                label: Text("Username"),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter e-mail.';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                label: Text("E-Mail"),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number.';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                label: Text("Phone Number"),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password.';
                } else {
                  return null;
                }
              },
              obscureText: controller.isPasswordObscured,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                label: const Text("Password"),
                prefixIcon: const Icon(Icons.fingerprint_outlined),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.isPasswordObscured = !controller.isPasswordObscured;
                    });
                  },
                  child: Icon(controller.isPasswordObscured
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.confirmPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm password.';
                } else {
                  return null;
                }
              },
              obscureText: controller.isConfirmPasswordObscured,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                label: const Text("Confirm Password"),
                prefixIcon: const Icon(Icons.fingerprint_outlined),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.isConfirmPasswordObscured =
                          !controller.isConfirmPasswordObscured;
                    });
                  },
                  child: Icon(controller.isConfirmPasswordObscured
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (SignUpController.instance.arePasswordsSame(
                        controller.password.text, controller.confirmPassword.text)) {
                      SignUpController.instance.registerUser(UserModel(
                        id: '',
                        userName: controller.username.text.trim(),
                        firstName: '',
                        lastName: '',
                        email: controller.email.text.trim(),
                        phoneNumber: controller.phoneNumber.text.trim(),
                        password: controller.password.text.trim(),
                      ));
                    }
                  }
                },
                child: const Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
