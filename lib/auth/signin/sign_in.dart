import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/auth/signin/signin_cubit.dart';
import 'package:flutter_clean_architecture/auth/signin/signin_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _SignInState();
}

class _SignInState extends State<LoginPage> {
  late SignInCubit _signInCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   late String _email;
   late String _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signInCubit = BlocProvider.of<SignInCubit>(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:
        BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInLoadedState) {
              print('Success');
            }
          },
          builder: (context, state) =>
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Provide an email';
                          }
                        },
                        decoration: const InputDecoration(
                            labelText: 'Email'
                        ),
                        onChanged: (input)=>_email = input,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.length < 6) {
                            return 'Longer password please';
                          }
                        },
                        decoration: const InputDecoration(
                            labelText: 'Password'
                        ),
                        onChanged: (input)=>_password = input,

                        obscureText: true,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _signInCubit.signIn(_email, _password);
                        },
                        child: const Text('Sign in'),
                      ),
                    ],
                  )
              ),)


    );
  }
}