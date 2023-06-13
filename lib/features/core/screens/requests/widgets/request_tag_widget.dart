import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class RequestTagWidget extends StatelessWidget {
  final String tag;
  const RequestTagWidget({
    required this.tag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          color: tPrimaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        tag,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
