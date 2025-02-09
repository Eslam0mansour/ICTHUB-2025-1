import 'package:first/authentication/auth_cubit/auth_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthIntialState());
  bool isHidden = true;

  void changePasswordVisibility() {
    isHidden = !isHidden;
    emit(PasswordVisibilyChanged());
  }
}
