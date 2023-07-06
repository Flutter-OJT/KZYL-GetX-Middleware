import 'package:get/get.dart';
import '../auth/auth_service.dart';

class LoginService extends GetxController {
  final _passwordVisible = false.obs;
  @override
  void onInit() {
    print('>>> LoginController started');
    super.onInit();
  }

  AuthService get authService => Get.find<AuthService>();
  bool get passwordVisible => _passwordVisible.value;
  set passwordVisible(bool value) => _passwordVisible.value = value;
}
