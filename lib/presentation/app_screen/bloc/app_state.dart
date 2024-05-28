part of 'app_bloc.dart';

class AppState extends Equatable {
  AppState({this.appModelObj});

  AppModel? appModelObj;

  @override
  List<Object?> get props => [appModelObj];
  AppState copyWith({AppModel? appMOdelObj}) {
    return AppState(
      appModelObj: appMOdelObj ?? this.appModelObj,
    );
  }
}