import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_desc_ttw/data/repositories/user_repository_impl.dart';
import 'package:test_desc_ttw/presentation/bloc/user/user_bloc.dart';
import 'package:test_desc_ttw/presentation/bloc/user/user_event.dart';
import 'package:test_desc_ttw/presentation/bloc/user/user_state.dart';

class HomePage extends StatelessWidget {

  final UserBloc bloc;

  HomePage(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepositoryImpl())..add(FetchUsers()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No Users Found'));
          },
        ),
      ),
    );
  }
}