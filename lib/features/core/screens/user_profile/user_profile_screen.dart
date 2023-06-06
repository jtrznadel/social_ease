import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/authentication/controllers/login_controller.dart';
import 'package:social_ease/features/core/screens/user_profile/widgets/user_avatar_widget.dart';
import 'package:social_ease/features/core/screens/user_profile/widgets/user_profile_button_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void emptyFunction() {
    // Empty function
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return Padding(
      padding: const EdgeInsets.all(tDashboardPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserAvatarWidget(),
          const SizedBox(
            height: tDashboardPadding * 2,
          ),
          UserProfileButtonWidget(
            title: "My Account",
            icon: const Icon(Icons.account_circle_outlined, color: Colors.black),
            press: () {},
          ),
          UserProfileButtonWidget(
            title: "Settings",
            icon: const Icon(Icons.settings_suggest_outlined, color: Colors.black),
            press: () {},
          ),
          UserProfileButtonWidget(
            title: "Notifications",
            icon: const Icon(Icons.notifications_active_outlined, color: Colors.black),
            press: () {},
          ),
          UserProfileButtonWidget(
            title: "Help Center",
            icon: const Icon(Icons.help_outline_outlined, color: Colors.black),
            press: () {},
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
    );
  }
}
