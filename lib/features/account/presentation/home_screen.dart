import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.email ?? 'Unknown'}!'),
            ElevatedButton(
              onPressed: () async {
                // Выход из аккаунта
                await FirebaseAuth.instance.signOut();
                // Переход обратно на AuthScreen
                context.go('/');
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}