import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/core/utils/image_constant.dart';
import 'package:flutter_application_2/core/utils/size_utils.dart';
import 'package:flutter_application_2/theme/custom_text_style.dart';
import 'package:flutter_application_2/widget/custom_image_view.dart';
import 'package:flutter_application_2/widget/custom_text_form_field.dart';

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';

import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_icon_button.dart';

import 'bloc/sign_in_page_bloc.dart';
import 'models/sign_in_page_model.dart';

class SignInPageScreen extends StatelessWidget {
  SignInPageScreen({Key? key})
    : super(
      key: key,
    );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignInPageBloc>(
      create: (context) => SignInPageBloc(
        SignInPageState(
          signInPageModelObj: SignInPageModel(),
        ))
          ..add(SignInPageInitialEvent()),
      child: SignInPageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.height,
          height: SizeUtils.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 0),
              colors: [ Colors.blue.shade900 ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.h,
                  vertical: 30.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmark100x100,
                      height: 83.adaptSize,
                      width: 83.adaptSize,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 26.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "",
                            style: TextStyle(
                              fontSize: 12
                            ),
                          ),
                          TextSpan(
                            text: "Welcome",
                            style: TextStyle(
                              fontSize: 14,
                            )
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Message other productive",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 39.v),
                    _buildSignInForm(context),
                    SizedBox(height: 25.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 6.h),
                        child: Text(
                          "olvide el password",
                          style: TextStyle(
                            fontSize: 12
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 23.h),
                    CustomElevatedButton(
                      text: "E-mail",
                      margin: EdgeInsets.only(
                        left: 5.h,
                        right: 6.h,
                      ),
                    ),
                    SizedBox(height: 20.v),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          onTapTxtDontHaveAnyAccount(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "dont have any account",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                )
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.cyan.shade200,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 56.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 18.v,
                              bottom: 5.v,
                            ),
                            child: Text(
                              "Sign With",
                              style: TextStyle(
                                fontSize: 9,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 29.h),
                            child: CustomIconButton(
                              height: 45.adaptSize,
                              width: 45.adaptSize,
                              padding: EdgeInsets.all(11.h),
                              decoration: IconButtonStyleHelper.outlineBlack,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGroup8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 21.h, bottom: 2.v),
                            child: CustomIconButton(
                              height: 41.adaptSize,
                              width: 41.adaptSize,
                              padding: EdgeInsets.all(10.h),
                              decoration: IconButtonStyleHelper.outlineBlack,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGroup8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSignInForm(context);
      },
      child: Column(
        children: [
          BlocSelector<SignInPageBloc, SignInPageState>(
            selector: (state) => state.emailController, 
            builder: (context, emailController) {
              return CustomTextFormField(
                controller: emailController,
                hintText: "E-mail",
                textInputType: TextInput.emailAddress,
                prefix: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 11.h,
                    vertical: 13.h,
                  ),
                  child: CustomImageView(
                    imagePath: "",
                    height: 15.h,
                    width: 20.h,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 42.h,
                ),
                validator: (value) {
                  if(value == null || 
                    (!isValidadEmail(value, isRequired: true))) {
                      return "";
                    }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 56.v,),
          BlocSelector<SignInPageBloc, SignInPageState, TextEditingController?>(
            selector: (state) => state.passwordController, 
            builder: (context, passwordController) {
              return CustomTextFormField()
            })
        ],
      ),
    );
  }
}