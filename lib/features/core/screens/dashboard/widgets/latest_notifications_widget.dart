import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart';

class LatestNotificationsWidget extends StatelessWidget {
  const LatestNotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Latest Notifications",
          style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
        ),
        Row(
          children: [
            Flexible(
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  child: Text(
                    "There are no new notifications",
                    style: txtTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  child: Text(
                    "There are no new messages",
                    style: txtTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
