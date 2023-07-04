import 'package:authentications/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthService>();
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('UserName : ${authController.username}'),
            Text('UserEmail : ${authController.useremail}'),
            Text('UserPassword : ${authController.userpassword}'),
            ElevatedButton(
                onPressed: () async {
                  await authController.logout();
                  Get.offNamed('/login');
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
