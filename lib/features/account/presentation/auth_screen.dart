import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainsup/app/blocs/auth_bloc.dart';
import 'package:trainsup/app/blocs/auth_state.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // Переход на HomeScreen при успешной авторизации
          GoRouter.of(context).go('/home');
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(
            appBar: AppBar(title: Text('Sign In / Sign Up')),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AuthError) {
          return Scaffold(
            appBar: AppBar(title: Text('Sign In / Sign Up')),
            body: Center(child: Text(state.message)),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text('Sign In / Sign Up')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) => value!.isEmpty ? 'Enter email' : null,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) =>
                        value!.length < 6 ? 'Enter valid password' : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _handleSignIn(context),
                    child: Text('Sign In'),
                  ),
                  ElevatedButton(
                    onPressed: () => _handleSignUp(context),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInEvent(_emailController.text, _passwordController.text),
      );
    }
  }

  void _handleSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpEvent(_emailController.text, _passwordController.text),
      );
    }
  }
}