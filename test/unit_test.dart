import 'package:flutter_test/flutter_test.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';
import 'package:social_ease/repository/user_repository/user_repository.dart';

void main() {
  late UserRepository userRepo;
  late AuthenticationRepository authRepo;

  setUp(() {
    userRepo = UserRepository();
    authRepo = AuthenticationRepository();
  });

  // test('Testing getting a user firstname', () async {
  //   const userId = "okjly62x9leHSBwl9Eqx9HC97PP2";
  //   const expectedFirstname = "Dominick"; // Oczekiwane imię użytkownika

  //   final firstname = await userRepo.getFirstname(userId);

  //   expect(firstname, equals(expectedFirstname));
  // });

  test('Testing are passwords same', () {
    const password = "testtest";
    const confirmPassword = "testtest";
    final result = authRepo.arePasswordsSame(password, confirmPassword);
    expect(result, equals(true));
  });
}
