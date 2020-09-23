import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final String fullName;

  const UserModel(this.firstName, this.lastName)
      : fullName = '$firstName $lastName';

  UserModel.fromJson(Map json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        fullName = '${json['firstName']} ${json['lastName']}';

  factory UserModel.fromJsonString(String json) {
    final map = jsonDecode(json);
    return UserModel.fromJson(map);
  }

  Future<void> save() async {
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> main() async {
  const u1 = UserModel('Rodrigo', 'Oliveira');
  const u2 = UserModel('Rodrigo', 'Oliveira');
  print(identical(u1, u2));
  await u1.save().then((_) => print(u1.fullName));
}
