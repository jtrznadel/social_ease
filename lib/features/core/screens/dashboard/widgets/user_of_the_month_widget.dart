import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';

class UserOfTheMonthWidget extends StatelessWidget {
  const UserOfTheMonthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User of the Month",
          style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
        ),
        Card(
          shadowColor: tPrimaryColor,
          elevation: 12,
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding - 10),
            margin: const EdgeInsets.all(tDashboardPadding - 15),
            child: const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: AssetImage(tProfileAvatarR),
                ),
              ),
              Column(
                children: [
                  Text('Samantha Hayland'),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('112')
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.comment_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('64')
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_border),
                          SizedBox(
                            width: 5,
                          ),
                          Text('98/100')
                        ],
                      ),
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
      ],
    );
  }
}
