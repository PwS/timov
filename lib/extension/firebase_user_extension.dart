part of 'extension.dart';

extension FirebaseUserExtension on FirebaseUser {
  ModelUser convertToUser(
          {String name = 'No Name',
          List<String> selectedGenres = const [],
          String selectedLanguage = 'English',
          int balance = 50000}) =>
      ModelUser(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<ModelUser> fromFireStore() async =>
      await ServiceUser.getUser(this.uid);
}
