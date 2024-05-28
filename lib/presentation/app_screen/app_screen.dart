import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_export.dart';
import 'package:flutter_application_2/core/utils/image_constant.dart';
import 'package:flutter_application_2/core/utils/size_utils.dart';
import 'package:flutter_application_2/widget/custom_image_view.dart';
import 'models/app_model.dart';
import 'bloc/app_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key})
    : super(key: key,
  );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(AppState(
        appModelObj: AppModel(),
      ))
        ..add(AppInitialEvent()),
      child: AppScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: SizeUtils.width,
              height: SizeUtils.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors: Colors.accents,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 143.v),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmark100x100,
                      height: 100.adaptSize,
                      width: 100.adaptSize,
                    ),
                    SizedBox(
                      height: 27.v,
                    ),
                    Text(
                      'ToDo',
                      style:  TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15
                      ),
                    ),
                    Spacer(),
                    Text(
                      "v 1.0.0",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        );
      },
    );
  }
}