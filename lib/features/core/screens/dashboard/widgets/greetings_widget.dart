import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({
    super.key,
    required this.nameDisplayed,
  });

  final String? nameDisplayed;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey, $nameDisplayed",
              style: txtTheme.bodyLarge,
            ),
            Text(
              "Start lending a hand",
              style: txtTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 88,
          width: 88,
          child: CircleAvatar(
            backgroundImage: AssetImage(tProfileAvatar),
          ),
        ),
      ],
    );
  }
}
