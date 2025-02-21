import 'dart:developer';

import 'package:first/authentication/auth_cubit/auth_cubit.dart';
import 'package:first/authentication/auth_cubit/auth_cubit_states.dart';
import 'package:first/authentication/register_screen.dart';
import 'package:first/authentication/widgets/custom_text_form_field.dart';
import 'package:first/authentication/widgets/custom_text_button.dart';
import 'package:first/home/home_screen.dart';
import 'package:first/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OurHomeScreen(),
              ),
            );
          }
          if (state is LoginErrorState) {
            log(state.errMsg);
          }
        },
        builder: (context, state) {
          return BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              AuthCubit authCubit = context.read<AuthCubit>();
              return Scaffold(
                backgroundColor: Colors.white,
                body: state is LoginLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                width: MediaQuery.sizeOf(context).width,
                                padding: EdgeInsets.all(16),
                                decoration:
                                    BoxDecoration(color: Color(0xff152534)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sign in to your Account",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Sign in to your Account",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextForm(
                                      controller: emailController,
                                      labelText: "Email",
                                      prefIcon: Icons.email,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextForm(
                                      controller: passwordController,
                                      labelText: "password",
                                      prefIcon: Icons.lock,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      isHidden: authCubit.isHidden,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            authCubit
                                                .changePasswordVisibility();
                                          },
                                          icon: authCubit.isHidden
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.remove_red_eye)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Forgot Button?",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 124, 176, 4),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          authCubit.login(data: {
                                            "email": emailController.text,
                                            "password": passwordController.text,
                                          });
                                        }
                                      },
                                      text: "Login",
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(),
                                        ),
                                        Text(" Or Login With "),
                                        Expanded(child: Divider()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   children: [
                                    //     CustomElevatedButton(
                                    //       imagePath: "assets/google.png",
                                    //       text: "Google",
                                    //       onPressed: () {},
                                    //     ),
                                    //     CustomElevatedButton(
                                    //       imagePath: "assets/facebook.png",
                                    //       text: "Facebook",
                                    //       onPressed: () {},
                                    //     ),
                                    //   ],
                                    // ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Don't have an account?"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CustomTextButton(
                                          text: "Register",
                                          onPressed: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen(),
                                          )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
