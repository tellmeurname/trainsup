import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trainsup/app/blocs/auth_bloc.dart';
import 'package:trainsup/features/account/domain/use_cases/auth_use_case.dart';
import 'package:trainsup/features/account/data/repositories/auth_repository.dart';
import 'package:trainsup/app/routes/router.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCq02M9P6NpNl_tXDyYE1DN3wKrhMkVKMw",
      authDomain: "trainingapp-e7b76.firebaseapp.com",
      projectId: "trainingapp-e7b76",
      storageBucket: "trainingapp-e7b76.firebasestorage.app",
      messagingSenderId: "889910640111",
      appId: "1:889910640111:web:ad65a63cbab0423ebc4a1a",
      measurementId: "G-DXZTQ5S0XF",
    ),
  );

  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        AuthUseCase(FirebaseAuthRepository(FirebaseAuth.instance)),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Fitness Tracker',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}