import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => <Object?>[];
}

class SignInInitialState extends SignInState {
  const SignInInitialState();
}

class SignInLoadingState extends SignInState {
  const SignInLoadingState();
}

class SignInLoadedState extends SignInState {
  const SignInLoadedState(this.userCredential);

  final UserCredential userCredential;

  @override
  String toString() => 'SignInLoadedState{articles: ${userCredential.toString()}';
}
