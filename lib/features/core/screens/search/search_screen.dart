import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/screens/requests/requests_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> categories = [
    'Volunteering',
    'Homelessness',
    'Elderly care',
    'Child and youth support',
    'Disability support',
    'Refugee and immigrant aid',
    'Healthcare assistance',
    'Social and economic support'
  ];

  final List<IconData> icons = [
    Icons.volunteer_activism_outlined,
    Icons.house_siding,
    Icons.elderly_rounded,
    Icons.escalator_warning_rounded,
    Icons.wheelchair_pickup_rounded,
    Icons.directions_run_rounded,
    Icons.healing_rounded,
    Icons.diversity_1_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(tDashboardPadding),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          AnimSearchBar(
            width: 500,
            textController: controller,
            onSuffixTap: () {
              setState(() {
                controller.clear();
              });
            },
            onSubmitted: (String value) {},
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryTile(
                  categoryName: categories[index],
                  icon: icons[index],
                  onTap: () {
                    // Wywołaj funkcję po naciśnięciu kafelka
                    Get.to(() => RequestsScreen(category: categories[index]));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onCategoryTilePressed(String category) {
    // Wywołaj funkcję po naciśnięciu kafelka
    print('Naciśnięto kafelek: $category');
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryTile({
    required this.categoryName,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap, // Przekaż funkcję wywołania zwrotnego do obsługi interakcji
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Stack(
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  icon,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
