import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/authentication/controllers/login_controller.dart';
import 'package:social_ease/features/core/screens/faq/faq_screen.dart';
import 'package:social_ease/features/core/screens/user_profile/update_user_profile_screen.dart';
import 'package:social_ease/features/core/screens/user_profile/widgets/user_avatar_widget.dart';
import 'package:social_ease/features/core/screens/user_profile/widgets/user_profile_button_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(tDashboardPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserAvatarWidget(),
            const SizedBox(
              height: tDashboardPadding * 2,
            ),
            UserProfileButtonWidget(
              title: "Edit Profile",
              icon: const Icon(Icons.account_circle_outlined,
                  color: Colors.black),
              press: () => Get.to(const UpdateUserProfileScreen()),
            ),
            UserProfileButtonWidget(
              title: "Settings",
              icon: const Icon(Icons.settings_suggest_outlined,
                  color: Colors.black),
              press: () {},
            ),
            UserProfileButtonWidget(
              title: "Notifications",
              icon: const Icon(Icons.notifications_active_outlined,
                  color: Colors.black),
              press: () {},
            ),
            UserProfileButtonWidget(
              title: "Help Center",
              icon:
                  const Icon(Icons.help_outline_outlined, color: Colors.black),
              press: () {
                Get.to(() => const FaqScreen());
              },
            ),
            UserProfileButtonWidget(
              title: "Log Out",
              icon: const Icon(Icons.logout_rounded, color: Colors.black),
              press: () {
                LogInController.instance.logoutUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
