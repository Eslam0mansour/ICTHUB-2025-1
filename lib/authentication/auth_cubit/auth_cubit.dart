import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first/authentication/auth_cubit/auth_cubit_states.dart';
import 'package:first/authentication/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthIntialState());
  bool isHidden = true;

  // 1- add dio package
  // 2- create object from dio
  // 3- create states
  // 4- create the register function
  // 5- implement the method in the register screen
  //============================================== Create Dio Object ===============================================================================
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://ioxfajusqcjuzjdjilsh.supabase.co/auth/v1/",
      headers: {
        "apikey":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlveGZhanVzcWNqdXpqZGppbHNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxMjgwNzIsImV4cCI6MjA1NDcwNDA3Mn0.w-ze172jYa_4f6GgEKs24rEOr2CipzkiaacSQaMAklc"
      },
    ),
  );

  //============================================== Create Register Method ===============================================================================
  // Register User Method
  Future<void> register({required Map<String, dynamic> data}) async {
    emit(RegisterLoadingState());
    try {
      // post request with dio
      Response response = await dio.post(
        "signup",
        data: data,
      );
        userModel = UserModel.fromJson(json: response.data);
      log(response.data.toString());
      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterErrorState(errMsg: e.toString()));
    }
  }

  // ============================================== change password visibility method ================================================================
  void changePasswordVisibility() {
    isHidden = !isHidden;
    emit(PasswordVisibilyChanged());
  }

  //============================================== Create Login Method ===============================================================================

  // UserModel
  UserModel? userModel;
  // Login User Method
  Future<void> login({required Map<String, dynamic> data}) async {
    emit(LoginLoadingState());
    try {
      // post request with dio
      Response response = await dio.post(
        "token?grant_type=password",
        data: data,
      );

      userModel = UserModel.fromJson(json: response.data);
      log("User name is ${userModel?.name}");
      log("Access Token is ${userModel?.accessToken}");
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(errMsg: e.toString()));
    }
  }

  //============================================== Create Logout Method ===============================================================================

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      Response response = await dio.post(
        "logout",
        options: Options(
          headers: {"Authorization": "Bearer ${userModel?.accessToken}"},
        ),
      );
      if (response.statusCode == 204) {
        emit(LogoutSuccessState());
      } else {
        throw "Failed to logout";
      }
    } catch (e) {
      emit(LogoutErrorState(errMsg: e.toString()));
    }
  }
}
