part of 'service.dart';

class ServiceUser {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(ModelUser user) {
    _userCollection.document(user.userId).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ''
    });
  }

  static Future<ModelUser> getUser(String id) async {
    DocumentSnapshot snapsot = await _userCollection.document(id).get();

    return ModelUser(id, snapsot.data['email'],
        balance: snapsot.data['balance'],
        profilePicture: snapsot.data['profilePicture'],
        selectedGenres: (snapsot.data['selectedGenres'] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapsot.data['selecetedLanguage'],
        name: snapsot.data['name']);
  }
}
