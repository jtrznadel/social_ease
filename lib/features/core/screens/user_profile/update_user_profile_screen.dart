import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/constants/colors.dart';
import 'package:social_ease/constants/sizes.dart';
import 'package:social_ease/features/core/controllers/user_profile_controller.dart';
import 'package:social_ease/features/core/screens/user_profile/widgets/user_avatar_widget.dart';
import 'package:social_ease/models/user_model.dart';

class UpdateUserProfileScreen extends StatelessWidget {
  const UpdateUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          "Edit profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder<UserModel>(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data!;

                  final email = TextEditingController(text: userData.email);
                  final userName = TextEditingController(text: userData.userName);
                  final firstName = TextEditingController(text: userData.firstName);
                  final lastName = TextEditingController(text: userData.lastName);
                  final phoneNumber = TextEditingController(text: userData.phoneNumber);
                  final password = TextEditingController(text: userData.password);

                  return Column(
                    children: [
                      const UserAvatarWidget(),
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: userName,
                              decoration: const InputDecoration(
                                labelText: "Username",
                                prefixIcon: Icon(Icons.person_outline_outlined),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: firstName,
                              decoration: const InputDecoration(
                                labelText: "First Name",
                                prefixIcon: Icon(Icons.person_outline_outlined),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: lastName,
                              decoration: const InputDecoration(
                                labelText: "Last Name",
                                prefixIcon: Icon(Icons.person_outline_outlined),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: phoneNumber,
                              decoration: const InputDecoration(
                                labelText: "Phone Number",
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: email,
                              decoration: const InputDecoration(
                                labelText: "E-Mail",
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              enabled: false,
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: password,
                              decoration: const InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.fingerprint),
                              ),
                              enabled: false,
                            ),
                            const SizedBox(height: tFormHeight),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final user = UserModel(
                                    id: userData.id,
                                    userName: userName.text.trim(),
                                    firstName: firstName.text.trim(),
                                    lastName: lastName.text.trim(),
                                    email: email.text.trim(),
                                    phoneNumber: phoneNumber.text.trim(),
                                    password: password.text.trim(),
                                  );

                                  await controller.updateRecord(user);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text(
                                  "Edit Profile",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
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
        ),
      ),
    );
  }
}
