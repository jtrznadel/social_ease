import 'package:flutter/material.dart';
import 'package:social_ease/features/core/screens/requests/widgets/request_tag_widget.dart';

class TagSectionWidget extends StatelessWidget {
  const TagSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      runAlignment: WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: [
        RequestTagWidget(
          tag: "Toy Drive",
        ),
        RequestTagWidget(
          tag: "Children",
        ),
        RequestTagWidget(
          tag: "Warsaw",
        ),
        RequestTagWidget(
          tag: "Local",
        ),
        RequestTagWidget(
          tag: "Community-based",
        ),
        RequestTagWidget(
          tag: "Long-term",
        ),
      ],
    );
  }
}
