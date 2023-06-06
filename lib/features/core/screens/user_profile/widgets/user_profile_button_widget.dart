import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart';

class UserProfileButtonWidget extends StatelessWidget {
  const UserProfileButtonWidget(
      {super.key, required this.title, required this.icon, required this.press});

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: tPrimaryColor,
              side: BorderSide.none,
              elevation: 6.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
          onPressed: press,
          child: Row(
            children: [
              Padding(padding: const EdgeInsets.only(left: 20.0, right: 10), child: icon),
              Text(
                title,
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: Colors.black, fontSize: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
