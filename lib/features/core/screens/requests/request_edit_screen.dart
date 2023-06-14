import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/request_model.dart';

import '../../../../constants/sizes.dart';
import '../../controllers/request_controller.dart';

class RequestEditScreen extends StatefulWidget {
  final RequestModel requestModel;
  const RequestEditScreen({Key? key, required this.requestModel}) : super(key: key);

  @override
  State<RequestEditScreen> createState() => _RequestEditScreenState();
}

class _RequestEditScreenState extends State<RequestEditScreen> {
  final ValueNotifier<String> title = ValueNotifier('');
  final ValueNotifier<String> description = ValueNotifier('');
  final ValueNotifier<String> location = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    title.value = widget.requestModel.title;
    description.value = widget.requestModel.description;
    location.value = widget.requestModel.location;
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedCategory = widget.requestModel.category;
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(RequestController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          "Edit request",
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
                  controller: TextEditingController(text: title.value),
                  onChanged: (value) => title.value = value,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    prefixIcon: Icon(Icons.title_rounded),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 15,
                ),
                TextFormField(
                  controller: TextEditingController(text: description.value),
                  onChanged: (value) => description.value = value,
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  value: widget.requestModel.category,
                  onChanged: (newValue) {
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
                  controller: TextEditingController(text: location.value),
                  onChanged: (value) => location.value = value,
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
                          id: widget.requestModel.id,
                          title: title.value.trim(),
                          description: description.value.trim(),
                          category: selectedCategory,
                          location: location.value.trim(),
                          createdAt: widget.requestModel.createdAt,
                          createdBy: widget.requestModel.createdBy,
                        );
                        await controller.updateRequest(request);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
