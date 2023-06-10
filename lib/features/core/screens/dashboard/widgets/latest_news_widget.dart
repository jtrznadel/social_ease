import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_ease/constants/sizes.dart';

import '../../../../../constants/colors.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Latest News",
          style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
        ),
        Card(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "New Patch 5.0.1 is available!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text("Take a look what's new!")
                ]),
                const Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
          ),
        )
      ],
    );
  }
}
