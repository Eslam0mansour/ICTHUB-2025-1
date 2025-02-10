import 'dart:developer';

import 'package:first/authentication/auth_cubit/auth_cubit.dart';
import 'package:first/authentication/auth_cubit/auth_cubit_states.dart';
import 'package:first/authentication/widgets/custom_button.dart';
import 'package:first/authentication/widgets/custom_text_button.dart';
import 'package:first/authentication/widgets/custom_text_form_field.dart';
import 'package:first/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OurHomeScreen(),
              ),
            );
          }
          if (state is RegisterErrorState) {
            log(state.errMsg);
          }
        },
        builder: (context, state) {
          return BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              AuthCubit authCubit = context.read<AuthCubit>();

              return Scaffold(
                backgroundColor: Colors.white,
                body: Form(
                  key: formKey,
                  child: state is RegisterLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.all(16),
                                    decoration:
                                        BoxDecoration(color: Color(0xff152534)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Register",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Create Your Account",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    left: 10,
                                    child: IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: Icon(
                                        Icons.arrow_back_sharp,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextForm(
                                      controller: nameController,
                                      labelText: "name",
                                      prefIcon: Icons.person,
                                      keyboardType: TextInputType.name,
                                    ),
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          authCubit.register(
                                            data: {
                                              "email": emailController.text,
                                              "password":
                                                  passwordController.text,
                                              "data": {
                                                "user_name": nameController.text
                                              }
                                            },
                                          );
                                        }
                                      },
                                      text: "Register",
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Already have an account?"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CustomTextButton(
                                          text: "Login",
                                          onPressed: () =>
                                              Navigator.pop(context),
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
