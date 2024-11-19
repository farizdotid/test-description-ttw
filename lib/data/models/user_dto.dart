import 'package:test_desc_ttw/domain/entities/user.dart';

class UserDto {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dob;

  UserDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      firstName: json['firstName'] as String?,
      lastName: json['lastName']as String?,
      email: json['email']as String?,
      dob: json['dob']as String?,
    );
  }

  User toEntity() {
    return User(
        id: id,
        firstName: firstName?? "-",
        lastName: lastName?? "-",
        email: email?? "-",
        dob: dob?? "-");
  }
}
