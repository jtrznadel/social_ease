import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/features/authentication/controllers/login_controller.dart';

import '../../../../../constants/sizes.dart';
import '../../forgot_password/widgets/forgot_password_modal_widget.dart';
import '../login_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.email,
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
                controller: controller.password,
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
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (_) => const ForgotPasswordModalWidget());
                      },
                      style: TextButton.styleFrom(foregroundColor: tPrimaryColor),
                      child: const Text("Forgot Password?"))),
              const SizedBox(
                height: tFormHeight,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: tPrimaryColor),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      LogInController.instance.loginUser(
                          controller.email.text.trim(), controller.password.text.trim());
                    }
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text("LOGIN"),
                ),
              )
            ],
          ),
        ));
  }
}
