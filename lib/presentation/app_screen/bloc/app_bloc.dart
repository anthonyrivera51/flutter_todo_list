import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/core/utils/navigator_service.dart';
import 'package:flutter_application_2/routes/app_routes.dart';
import '../../../core/app_export.dart';
import '../models/app_model.dart';
part 'app_event.dart';
part 'app_state.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AppState initialState) : super(initialState) {
    on<AppInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AppInitialEvent event, 
    Emitter<AppState> emit
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.appLogin,
      );
    });
  }
}