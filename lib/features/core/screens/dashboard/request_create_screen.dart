import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/request_controller.dart';
import 'package:social_ease/models/request_model.dart';

class RequestCreateScreen extends StatefulWidget {
  const RequestCreateScreen({super.key});

  @override
  State<RequestCreateScreen> createState() => _RequestCreateScreenState();
}

class _RequestCreateScreenState extends State<RequestCreateScreen> {
  String selectedCategory = 'Volunteering';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(RequestController());

    void resetForm() {
      formKey.currentState?.reset();
      controller.title.clear();
      controller.description.clear();
      controller.location.clear();
      selectedCategory = 'Volunteering';
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              resetForm();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          "Create request",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.title,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title.';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Title",
                    prefixIcon: Icon(Icons.title_rounded),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 15,
                ),
                TextFormField(
                  controller: controller.description,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description.';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Description",
                    prefixIcon: Icon(Icons.description_outlined),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: tFormHeight - 15,
                ),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(prefixIcon: Icon(Icons.category_outlined)),
                  value: selectedCategory,
                  onChanged: (newValue) {
                    // Aktualizacja wybranej kategorii
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: <String>[
                    'Volunteering',
                    'Homelessness',
                    'Elderly care',
                    'Child and youth support',
                    'Disability support',
                    'Refugee and immigrant aid',
                    'Healthcare assistance',
                    'Social and economic support'
                    // Dodaj więcej kategorii, jeśli jest to konieczne
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: tFormHeight - 15,
                ),
                TextFormField(
                  controller: controller.location,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter location.';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Location",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final request = RequestModel(
                              title: controller.title.text.trim(),
                              description: controller.description.text.trim(),
                              category: selectedCategory,
                              location: controller.location.text.trim(),
                              createdAt: DateTime.now().toString(),
                              createdBy: controller.getUserId());
                          await controller.createRequest(request);
                          resetForm();
                        } else {
                          Get.snackbar("Something went wrong", "Check all given data",
                              margin: const EdgeInsets.all(10),
                              backgroundColor: Colors.red.withOpacity(0.3));
                        }
                      },
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                )
              ],
            )),
      )),
    );
  }
}
