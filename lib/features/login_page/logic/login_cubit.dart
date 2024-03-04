import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    isVisible = !isVisible;
    emit(ChangePasswordVisibilityState());
  }

    Future<UserCredential> signInWithFacebook() async {

      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return  FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // void requestPermission() async {
  //   final status = await Permission.storage.request();
  //   print(status);
  // }

  void userGoogleLogin(){
    emit(SocialGoogleLoginLoadingState());
    //requestPermission();
    signInWithGoogle().then((value) {
      emit(SocialGoogleLoginSuccessState());
    }).catchError((error){
      emit(SocialGoogleLoginFailureState(error.toString()));
    });
  }

  void userLogin(){
    emit(LoginLoadingState());
    //requestPermission();
    signInWithFacebook().then((value) {
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginFailureState(error.toString()));
    });
  }
  void userrLogin({
    required String email,
    required String password,
  }){
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SocialLoginSuccessState());
    }).catchError((error){
      emit(SocialLoginFailureState(
        error.toString(),
      ));
    });
  }
}
