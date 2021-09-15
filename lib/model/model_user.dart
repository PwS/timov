part of 'model.dart';

class ModelUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  ModelUser(this.userId, this.email,
      {this.name,
      this.profilePicture,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  @override
  String toString() {
    return 'ModelUser {id=$userId ,Nama =$name , email = $email}';
  }

  @override
  List<Object> get props => [
        userId,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
