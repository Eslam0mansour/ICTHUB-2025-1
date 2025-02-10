import 'dart:developer';

import 'package:first/authentication/auth_cubit/auth_cubit.dart';
import 'package:first/authentication/auth_cubit/auth_cubit_states.dart';
import 'package:first/authentication/login_screen.dart';
import 'package:first/screens/favorite_screen.dart';
import 'package:first/screens/grid_and_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OurHomeScreen extends StatefulWidget {
  const OurHomeScreen({super.key});

  @override
  State<OurHomeScreen> createState() => _OurHomeScreenState();
}

class _OurHomeScreenState extends State<OurHomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    GridAndStackView(),
    FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            AuthCubit authCubit = context.read<AuthCubit>();
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: currentIndex,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: false,
                  selectedItemColor: Colors.teal,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorite',
                    ),
                  ]),
              appBar: AppBar(
                title: Text('Our Home Screen'),
                automaticallyImplyLeading: false,
              ),
              body: screens[currentIndex],
            );
          },
        );
      },
    );
  }
}
