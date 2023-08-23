import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/user.dart';
import '../../domain/usecases/usecase.dart';
import '../state/state.dart';

class AuthController extends StateNotifier<AuthState> {
  Login loginUseCase;
  Register registerUseCase;
  Logout logoutUseCase;
  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  }) : super(LoginInitial());

  void login({
    required String email,
    required String password,
  }) async {
    state = LoggingIn();

    final response = await loginUseCase(LoginParams(
      email: email,
      password: password,
    ));

    response.fold((failure) {
      state = LoginError(failure);
    }, (User user) {
      state = Authenticated(
        user,
      );
    });
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String accountType,
  }) async {
    state = Registering();

    final response = await registerUseCase(RegisterParams(
      name: name,
      email: email,
      password: password,
      accountType: accountType,
    ));

    response.fold((failure) {
      state = RegistrationError(failure);
    }, (_) {
      state = RegistrationSuccessful();
    });
  }

  Future<void> logout() async {
    state = LoggingIn();
    final response = await logoutUseCase();
    response.fold((failure) {
      state = LoginError(failure);
    }, (success) {
      state = Unauthenticated();
    });
  }
}

final authStateProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) {
  return AuthController(
    registerUseCase: ref.watch(registerUseCaseProvider),
    loginUseCase: ref.watch(loginUseCaseProvider),
    logoutUseCase: ref.watch(logOutUseCaseProvider),
  );
});
