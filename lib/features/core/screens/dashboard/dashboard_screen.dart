import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/image_strings.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/screens/dashboard/request_create_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey, @username",
                style: txtTheme.bodyLarge,
              ),
              Text(
                "Start lending a hand",
                style: txtTheme.titleMedium,
              ),
              const SizedBox(
                height: tDashboardPadding,
              ),
              Text(
                "Latest Notifications",
                style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
              ),
              const SizedBox(
                height: tDashboardPadding - 10,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: tTertiaryColor),
                        child: Text(
                          "There are no new notifications",
                          style: txtTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: tTertiaryColor),
                        child: Text(
                          "There are no new messages",
                          style: txtTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Explore Your Requests",
                style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(tDefaultSize - 20),
                  children: [
                    SizedBox(
                      width: 260,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Volounteer is highly needed",
                                      style: txtTheme.titleLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Flexible(
                                      child: Image(
                                    image: AssetImage(tProfileAvatar),
                                    height: 110,
                                  ))
                                ],
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 260,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Volounteer is highly needed",
                                      style: txtTheme.titleLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Flexible(
                                      child: Image(
                                    image: AssetImage(tProfileAvatar),
                                    height: 110,
                                  ))
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () => Get.to(const RequestCreateScreen()),
                icon: const Icon(
                  Icons.add_circle_outline_rounded,
                  color: tPrimaryColor,
                ),
                label: Text(
                  "Add new request",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ));
  }
}
