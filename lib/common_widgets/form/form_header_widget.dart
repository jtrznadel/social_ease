import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/sizes.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {super.key,
      required this.imageScale,
      required this.image,
      required this.title,
      required this.subTitle});

  final String image, title, subTitle;
  final double imageScale;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: tDefaultSize + 10),
        SizedBox(
            height: size.height * imageScale, child: SvgPicture.asset(image)),
        const SizedBox(height: tDefaultSize),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
