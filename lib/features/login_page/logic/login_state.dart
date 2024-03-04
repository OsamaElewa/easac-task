
abstract class LoginState{}

class LoginInitialState extends LoginState{}

class ChangePasswordVisibilityState extends LoginState{}
class ChangeCheckBoxValueState extends LoginState{}

class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class SocialLoginLoadingState extends LoginState{}
class SocialLoginSuccessState extends LoginState{}
class SocialLoginFailureState extends LoginState{
  final String error;
  SocialLoginFailureState(this.error);
}


class SocialGoogleLoginLoadingState extends LoginState{}
class SocialGoogleLoginSuccessState extends LoginState{}
class SocialGoogleLoginFailureState extends LoginState{
  final String error;
  SocialGoogleLoginFailureState(this.error);
}



class LoginFailureState extends LoginState{
  final String error;
  LoginFailureState(this.error);
}