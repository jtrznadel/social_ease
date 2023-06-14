import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/request_controller.dart';
import 'package:social_ease/features/core/screens/requests/request_details_screen.dart';
import 'package:social_ease/models/request_model.dart';

class RequestsScreen extends StatefulWidget {
  final String category;

  const RequestsScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  List<RequestModel> requests = []; // Lista przechowująca pobrane zapytania
  final controller = Get.put(RequestController());

  @override
  void initState() {
    super.initState();
    fetchRequestsByCategory();
  }

  Future<void> fetchRequestsByCategory() async {
    // Wywołaj funkcję getRequestsByCategory z odpowiednimi parametrami
    final List<RequestModel> fetchedRequests =
        await controller.getRequestsByCategory(widget.category);
    setState(() {
      requests = fetchedRequests;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests for ${widget.category}',
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
      body: requests.isEmpty
          ? const Center(
              child: Text(
                'No requests available at the moment.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(tDashboardPadding),
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (BuildContext context, int index) {
                  final request = requests[index];
                  return GestureDetector(
                    onTap: () => Get.to(RequestDetailsScreen(
                      requestModel: request,
                    )),
                    child: Material(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 15, right: 10, bottom: 15, left: 10),
                        child: ListTile(
                          title: Text(
                            request.title,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: tDashboardPadding - 10,
                              ),
                              Text(
                                request.description,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: tDashboardPadding - 10,
                              ),
                              Text(
                                'Location: ${request.location}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
