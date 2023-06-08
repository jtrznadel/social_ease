import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/features/authentication/controllers/signup_controller.dart';
import 'package:social_ease/models/user_model.dart';

import '../../../../../constants/sizes.dart';
import '../../login/login_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

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
                  decoration: const InputDecoration(
                      label: Text("Username"),
                      prefixIcon: Icon(Icons.person_outline_outlined))),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                      label: Text("E-Mail"), prefixIcon: Icon(Icons.email_outlined))),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(
                      label: Text("Phone Number"), prefixIcon: Icon(Icons.phone))),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.fingerprint_outlined),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined))),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                  controller: controller.confirmPassword,
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        SignUpController.instance.registerUser(UserModel(
                            id: '',
                            userName: controller.username.text.trim(),
                            firstName: '',
                            lastName: '',
                            email: controller.email.text.trim(),
                            phoneNumber: controller.phoneNumber.text.trim(),
                            password: controller.password.text.trim()));
                      }
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text("Sign Up")),
              )
            ],
          )),
    );
  }
}
