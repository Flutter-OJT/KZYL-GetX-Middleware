import 'package:get/get.dart';
import '../auth/auth_service.dart';


class LoginService extends GetxController {
  @override
  void onInit() {
    print('>>> LoginController started');
    super.onInit();
  }

  AuthService get authService => Get.find<AuthService>();
}