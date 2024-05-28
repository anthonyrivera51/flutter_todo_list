import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/sign_in_page_model.dart';
part 'sign_in_page_event.dart';
part 'sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc(SignInPageState initialState) : super(initialState){
    on<SignInPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SignInPageInitialEvent event,
    Emitter<SignInPageState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }
}