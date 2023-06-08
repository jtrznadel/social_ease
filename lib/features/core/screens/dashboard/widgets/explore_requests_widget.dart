import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/request_controller.dart';
import 'package:social_ease/models/request_model.dart';

import '../../../../../constants/colors.dart';

class ExploreRequestsWidget extends StatelessWidget {
  const ExploreRequestsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestController());

    final txtTheme = Theme.of(context).textTheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Explore Your Requests",
        style: GoogleFonts.montserrat(color: tSecondaryColor, fontSize: 24.0),
      ),
      const SizedBox(
        height: tDashboardPadding - 15,
      ),
      SizedBox(
        height: 124,
        child: FutureBuilder<List<RequestModel>>(
          future: controller.getUserRequestsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return Card(
                        elevation: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(10),
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title,
                                style: txtTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: tDashboardPadding - 10,
                              ),
                              Text(snapshot.data![index].category),
                              const SizedBox(
                                height: tDashboardPadding - 10,
                              ),
                              Text("Location: ${snapshot.data![index].location}")
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    ]);
  }
}
