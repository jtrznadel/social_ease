import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:social_ease/common_widgets/form/form_header_widget.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/image_strings.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/constants/text_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: "Password Reset",
            body: "Password has been successfuly reseted"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const FormHeaderWidget(
                imageScale: 0.2,
                image: tForgotPasswordResetImage,
                title: tForgotPasswordResetTitle,
                subTitle: tForgotPasswordResetSubTitle),
            Form(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "New Password",
                          prefixIcon: Icon(Icons.fingerprint_outlined),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: tSecondaryColor,
                          )),
                    ),
                    const SizedBox(
                      height: tFormHeight - 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(Icons.fingerprint_outlined),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: tSecondaryColor,
                          )),
                    ),
                    const SizedBox(
                      height: tFormHeight,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor),
                        onPressed: () {
                          triggerNotification();
                          Navigator.pop(context);
                        },
                        child: const Text("RESET PASSWORD"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
