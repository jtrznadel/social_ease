import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/image_strings.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/request_controller.dart';
import 'package:social_ease/features/core/controllers/user_profile_controller.dart';
import 'package:social_ease/features/core/screens/requests/request_edit_screen.dart';
import 'package:social_ease/models/request_model.dart';

import 'widgets/tag_section_widget.dart';

class RequestDetailsScreen extends StatelessWidget {
  final RequestModel requestModel;
  const RequestDetailsScreen({super.key, required this.requestModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    final requestController = Get.put(RequestController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const Image(image: AssetImage(tRequestBgSample)),
                const SizedBox(
                  height: tDashboardPadding * 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(tDashboardPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TagSectionWidget(),
                        const SizedBox(
                          height: tDashboardPadding,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  requestModel.title,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Description",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  requestModel.description,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Category",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  requestModel.category,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Contact",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Unicorn Foundation \n19A, Fryderyka Joliot-Curie \nPhone No. 455-543-867",
                                      textAlign: TextAlign.justify,
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.send_rounded),
                                      label: const Text("Text to us"),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20)),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: tDashboardPadding,
                                ),
                                controller.getUserId() == requestModel.createdBy
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton.icon(
                                                onPressed: () => Get.to(RequestEditScreen(
                                                    requestModel: requestModel)),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.lightBlue,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(100)),
                                                    side: const BorderSide(
                                                        color: Colors.transparent)),
                                                icon: const Icon(Icons.edit),
                                                label: const Text("Edit")),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: ElevatedButton.icon(
                                                onPressed: () => QuickAlert.show(
                                                    context: context,
                                                    type: QuickAlertType.confirm,
                                                    text: "Are you sure?",
                                                    confirmBtnText: "Yes",
                                                    cancelBtnText: "No",
                                                    onCancelBtnTap: () =>
                                                        Navigator.pop(context),
                                                    onConfirmBtnTap: () =>
                                                        requestController.deleteRequest(
                                                            requestModel.id!)),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red[300],
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(100)),
                                                    side: const BorderSide(
                                                        color: Colors.transparent)),
                                                icon: const Icon(
                                                    Icons.remove_circle_outline_rounded),
                                                label: const Text("Remove")),
                                          )
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.335,
              left: size.width * 0.05,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDashboardPadding, vertical: tDashboardPadding - 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: tPrimaryColor),
                width: size.width * 0.9,
                height: 80,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    requestModel.title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Created by: Unicorn Foundation',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
