import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/features/core/screens/dashboard/dashboard_screen.dart';
import 'package:social_ease/features/core/screens/explore/explore_screen.dart';
import 'package:social_ease/features/core/screens/message_centre/message_centre_screen.dart';
import 'package:social_ease/features/core/screens/search/search_screen.dart';
import 'package:social_ease/features/core/screens/user_profile/user_profile_screen.dart';

import '../../../../constants/text_strings.dart';

class NavigationProfile extends StatefulWidget {
  const NavigationProfile({super.key});
  @override
  State<NavigationProfile> createState() => _NavigationProfile();
}

const items = [
  Icon(
    Icons.search,
    size: 30,
  ),
  Icon(
    Icons.explore_outlined,
    size: 30,
  ),
  Icon(
    Icons.home_outlined,
    size: 30,
  ),
  Icon(
    Icons.question_answer_outlined,
    size: 30,
  ),
  Icon(
    Icons.account_circle_outlined,
    size: 30,
  ),
];

class _NavigationProfile extends State<NavigationProfile> {
  final _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(tAppName, style: txtTheme.titleLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          SearchScreen(),
          ExploreScreen(),
          DashboardScreen(),
          MessageCentreScreen(),
          UserProfileScreen()
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOutCubic,
        index: 2,
        backgroundColor: Colors.white,
        color: tPrimaryColor,
        height: 60,
        items: items,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
