import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 115,
        child: Stack(fit: StackFit.expand, children: [
          const CircleAvatar(
            backgroundImage: AssetImage(tProfileAvatar),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
                height: 36,
                width: 36,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: tSecondaryColor.withOpacity(0.7),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: tPrimaryColor,
                    size: 22,
                  ),
                )),
          ),
        ]));
  }
}
