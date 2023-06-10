import 'package:flutter/material.dart';
import 'package:social_ease/constants/image_strings.dart';
import 'package:social_ease/constants/sizes.dart';

class MessageCenterScreen extends StatelessWidget {
  const MessageCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(tDashboardPadding),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    foregroundColor: Colors.black,
                    child: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(tProfileAvatarR),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(tProfileAvatarR1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(tProfileAvatarR2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 60,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(tProfileAvatarR3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
