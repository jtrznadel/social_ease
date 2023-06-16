import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_ease/models/request_model.dart';
import 'package:social_ease/repository/test/authentication_repository.dart';
import 'package:social_ease/repository/test/request_repository.dart';

class MockFirestore {}

void main() {
  group('AuthenticationRepository', () {
    late MockFirebaseAuth mockAuth;
    late AuthenticationRepository authRepository;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      authRepository = AuthenticationRepository(auth: mockAuth);
    });

    test('Should log out the user when logout is called', () async {
      // Act
      await authRepository.logout();

      // Assert
      expect(mockAuth.signOut(), completes);
    });
    test('Should log in the user with loginUserWithEmailAndPassword', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'testPassword';

      // Act
      await authRepository.loginUserWithEmailAndPassword(email, password);

      // Assert
      final userCredential =
          await mockAuth.signInWithEmailAndPassword(email: email, password: password);
      expect(userCredential.user, isNotNull);
    });

    group('PasswordUtils', () {
      test('Should return true if passwords are the same', () {
        // Arrange
        const password = 'testPassword';

        // Act
        final result = authRepository.arePasswordsSame(password, password);

        // Assert
        expect(result, isTrue);
      });

      test('Should return false if passwords are different', () {
        // Arrange
        const password = 'testPassword';
        const differentPassword = 'differentPassword';

        // Act
        final result = authRepository.arePasswordsSame(password, differentPassword);

        // Assert
        expect(result, isFalse);
      });
    });
  });

  group('RequestRepository', () {
    late RequestRepository requestRepository;
    late FakeFirebaseFirestore fakeFirestore;
    String docId = '';

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      requestRepository = RequestRepository(db: fakeFirestore);
    });

    test('Should add data to the collection', () async {
      const request = RequestModel(
          title: 'title',
          description: 'description',
          category: 'category',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc1 = await requestRepository.createRequest(request);
      docId = doc1;
      expect(fakeFirestore.dump(), equals('''{
  "requests": {
    "$doc1": {
      "title": "title",
      "description": "description",
      "category": "category",
      "location": "location",
      "createdAt": "createdAt",
      "createdBy": "createdBy",
      "id": "$doc1"
    }
  }
}'''));
    });

    test('Should update data in the collection', () async {
      String requestId = '';
      const request = RequestModel(
        title: 'title',
        description: 'description',
        category: 'category',
        location: 'location',
        createdAt: 'createdAt',
        createdBy: 'createdBy',
      );
      final doc1 = await requestRepository.createRequest(request);
      requestId = doc1;
      RequestModel requestUpdated = RequestModel(
          title: 'titleUpdated',
          description: 'description',
          category: 'category',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy',
          id: requestId);
      await requestRepository.updateRequest(requestUpdated);
      expect(fakeFirestore.dump(), equals('''{
  "requests": {
    "$doc1": {
      "title": "titleUpdated",
      "description": "description",
      "category": "category",
      "location": "location",
      "createdAt": "createdAt",
      "createdBy": "createdBy",
      "id": "$doc1"
    }
  }
}'''));
    });

    test('Should remove data from the collection', () async {
      const request = RequestModel(
          title: 'title',
          description: 'description',
          category: 'category',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc1 = await requestRepository.createRequest(request);
      await requestRepository.deleteRequest(doc1);
      expect(fakeFirestore.dump(), equals('''{
  "requests": {}
}'''));
    });

    test('Should get data by category and return the correct list which counts 1 element',
        () async {
      const request1 = RequestModel(
          title: 'title',
          description: 'description',
          category: 'category1',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc1 = await requestRepository.createRequest(request1);

      // Update the title for second request
      const request2 = RequestModel(
          title: 'titleUpdated', // Change the title value
          description: 'description',
          category: 'category2',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc2 = await requestRepository.createRequest(request2);

      const request3 = RequestModel(
          title: 'titleUpdated', // Change the title value
          description: 'description',
          category: 'category3',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc3 = await requestRepository.createRequest(request3);

      final list = await requestRepository.getRequestsByCategory('category2');
      expect(list.length, 1);
    });

    test(
        'Should get data by category and return the correct list which counts 2 elements',
        () async {
      const request1 = RequestModel(
          title: 'title',
          description: 'description',
          category: 'category1',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc1 = await requestRepository.createRequest(request1);

      // Update the title for second request
      const request2 = RequestModel(
          title: 'titleUpdated', // Change the title value
          description: 'description',
          category: 'category2',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc2 = await requestRepository.createRequest(request2);

      const request3 = RequestModel(
          title: 'titleUpdated', // Change the title value
          description: 'description',
          category: 'category2',
          location: 'location',
          createdAt: 'createdAt',
          createdBy: 'createdBy');
      final doc3 = await requestRepository.createRequest(request2);

      final list = await requestRepository.getRequestsByCategory('category2');
      expect(list.length, 2);
    });
  });
}
