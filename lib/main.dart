import 'package:first/authentication/auth_cubit/auth_cubit.dart';
import 'package:first/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(IctApp());
}

class IctApp extends StatelessWidget {
  const IctApp({super.key});

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
