part of 'sign_in_page_bloc.dart';


class SignInPageState extends Equatable {
  SignInPageState({
    this.emailController, this.passwordController, this.signInPageModelObj
  });

  TextEditingController? emailController;
  TextEditingController? passwordController;
  SignInPageModel? signInPageModelObj;

  @override
  List<Object?> get props => 
    [emailController, passwordController, signInPageModelObj];
  SignInPageState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    SignInPageModel? signInPageModelObj,
  }) {
    return SignInPageState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      signInPageModelObj: signInPageModelObj ?? this.signInPageModelObj,
    );
  }
}