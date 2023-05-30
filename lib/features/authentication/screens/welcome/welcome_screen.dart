import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/constants/text_strings.dart';
import 'package:social_ease/features/authentication/screens/login/login_screen.dart';

import '../../../../constants/image_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              height: size.height * 0.5,
              child: SvgPicture.asset(tWelcomeImage)),
          Column(
            children: [
              Text(
                tWelcomeTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 3.0),
              Text(
                tWelcomeSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: tPrimaryColor,
                        side: BorderSide(color: tPrimaryColor),
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                    child: Text(
                      "Login".toUpperCase(),
                    )),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(),
                          foregroundColor: tWhiteColor,
                          backgroundColor: tPrimaryColor,
                          side: BorderSide(color: tPrimaryColor),
                          padding:
                              EdgeInsets.symmetric(vertical: tButtonHeight)),
                      child: Text("SignUp".toUpperCase())))
            ],
          )
        ]),
      ),
    );
  }
}
