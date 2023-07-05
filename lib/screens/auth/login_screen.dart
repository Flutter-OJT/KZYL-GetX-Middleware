import 'package:authentications/repository/user_repository.dart';
import 'package:authentications/screens/auth/register.dart';
import 'package:authentications/services/login/login_service.dart';
import 'package:authentications/services/prefs/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginService> {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final storageService = Get.find<StorageService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Login Here'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty!!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty!!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        try {
                          final CrudUser userCrud = CrudUser();
                          final userlist = await userCrud.list();
                          final user = userlist!
                              .firstWhere((user) => user.email == email);

                          if (user.email == email &&
                              user.password == password) {
                            controller.authService.authenticated = true;

                            await storageService.storage
                                .write(key: 'useremail', value: email);
                            await storageService.storage
                                .write(key: 'userpassword', value: password);
                            await storageService.storage
                                .write(key: 'username', value: user.name);
                            controller.authService.useremail = email;
                            controller.authService.userpassword = password;
                            controller.authService.username = user.name;

                            //redirect to homescreen
                            Get.offNamed('/home');
                          } else {
                            throw Exception(
                                'Login Failed : Invalid email or invalid password');
                          }
                        } catch (e) {
                          const snackBar = SnackBar(
                              content: Text(
                                  'Login Failed : Invalid email or invalid password'),
                              behavior: SnackBarBehavior.floating);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => RegistrationScreen());
                      },
                      child: const Text('Register')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
