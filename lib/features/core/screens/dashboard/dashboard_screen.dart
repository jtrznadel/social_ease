import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/user_profile_controller.dart';
import 'package:social_ease/features/core/screens/dashboard/request_create_screen.dart';
import 'package:social_ease/features/core/screens/dashboard/widgets/explore_requests_widget.dart';

import '../../../../constants/image_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(tDashboardPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String>(
              future: controller.getFirstname(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final nameDisplayed = snapshot.data;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              },
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
            const SizedBox(
              height: 10,
            ),
            const ExploreRequestsWidget(),
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
            Text(
              "Latest Notifications",
              style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
