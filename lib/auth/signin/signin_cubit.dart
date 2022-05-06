
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/auth/firebase_helper.dart';
import 'package:flutter_clean_architecture/auth/signin/signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInInitialState());

  void signIn(String email, String password) {
    emit(const SignInInitialState());
    FirebaseHelper.signIn(
        email: email,
        password: password,
        onSuccess: (UserCredential userCredential) {
          emit(SignInLoadedState(userCredential));
        },
        onFailure: (){});
  }
}
