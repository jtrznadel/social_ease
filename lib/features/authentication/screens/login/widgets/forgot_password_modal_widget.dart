import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgotPasswordModalWidget extends StatefulWidget {
  const ForgotPasswordModalWidget({
    super.key,
  });

  @override
  State<ForgotPasswordModalWidget> createState() =>
      _ForgotPasswordModalWidgetState();
}

class _ForgotPasswordModalWidgetState extends State<ForgotPasswordModalWidget> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: size.height * 0.5,
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.15,
              child: SvgPicture.asset(
                  !_flag ? tForgotPasswordImage : tWelcomeImage),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              !_flag ? tForgotPasswordTitle : tForgotPasswordSuccessTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
                !_flag
                    ? tForgotPasswordSubTitle
                    : tForgotPasswordSuccessSubTitle,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            !_flag
                ? Form(
                    child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "E-mail",
                        prefixIcon: Icon(Icons.email_outlined)),
                  ))
                : Container(),
            const SizedBox(
              height: tFormHeight,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      if (_flag) {
                        Navigator.pop(context);
                        Future.delayed(
                            const Duration(milliseconds: 100), () {});
                      } else {
                        setState(() {
                          _flag = !_flag;
                        });
                      }
                    },
                    child: Text(!_flag ? "Submit" : "OK")))
          ],
        ),
      ),
    );
  }
}
