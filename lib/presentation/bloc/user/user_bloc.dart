import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_desc_ttw/domain/repositories/user_repositories.dart';
import 'package:test_desc_ttw/presentation/bloc/user/user_event.dart';
import 'package:test_desc_ttw/presentation/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()){
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}