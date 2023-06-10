import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/user_profile_controller.dart';
import 'package:social_ease/features/core/screens/dashboard/widgets/explore_requests_widget.dart';
import 'package:social_ease/features/core/screens/dashboard/widgets/greetings_widget.dart';
import 'package:social_ease/features/core/screens/dashboard/widgets/latest_news_widget.dart';
import 'package:social_ease/features/core/screens/dashboard/widgets/latest_notifications_widget.dart';
import 'package:social_ease/features/core/screens/dashboard/widgets/user_of_the_month_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
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
                  return GreetingsWidget(nameDisplayed: nameDisplayed);
                }
              },
            ),
            const UserOfTheMonthWidget(),
            const SizedBox(
              height: tDashboardPadding - 10,
            ),
            const LatestNotificationsWidget(),
            const SizedBox(
              height: tDashboardPadding - 10,
            ),
            const ExploreRequestsWidget(),
            const LatestNewsWidget()
          ],
        ),
      ),
    );
  }
}
