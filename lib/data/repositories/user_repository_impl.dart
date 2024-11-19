import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_desc_ttw/data/models/user_dto.dart';
import 'package:test_desc_ttw/domain/entities/user.dart';
import 'package:test_desc_ttw/domain/repositories/user_repositories.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> fetchUsers() async {
    final String response =
        await rootBundle.loadString('assets/files/data.json');
    final List<dynamic> jsonData = json.decode(response);

    return jsonData.map((data) => UserDto.fromJson(data).toEntity()).toList();
  }
}
