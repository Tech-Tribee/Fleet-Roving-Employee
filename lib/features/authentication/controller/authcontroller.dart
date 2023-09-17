import 'package:fleet_roving_employee/features/authentication/service/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authServiceRepository = ref.watch(authRepositoryProvider);
  return AuthController(authService: authServiceRepository);
});

class AuthController {
  final AuthService authService;

  AuthController({required this.authService});

  void signup(
    BuildContext context,
    String userName,
    String password,
  ) {
    authService.signupUser(
      context: context,
      userName: userName,
      password: password,
    );
  }

  void logout(BuildContext context) {
    authService.logout(context);
  }
}
