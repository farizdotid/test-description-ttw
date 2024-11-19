import 'package:flutter/material.dart';
import 'package:test_desc_ttw/data/repositories/user_repository_impl.dart';
import 'package:test_desc_ttw/presentation/bloc/user/user_bloc.dart';
import 'package:test_desc_ttw/presentation/pages/home/home_page.dart';

void main() {
  final userRepository = UserRepositoryImpl();
  final bloc = UserBloc(userRepository);
  runApp(MyApp(bloc));
}

class MyApp extends StatelessWidget {
  final UserBloc bloc;

  MyApp(this.bloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users',
      home: HomePage(bloc)
    );
  }
}