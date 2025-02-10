import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    log("${bloc.toString()} $change");
  }

  @override
  void onClose(BlocBase bloc) {
   log("${bloc.toString()} closed");
  }

  @override
  void onCreate(BlocBase bloc) {
    log("${bloc.toString()} created");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}