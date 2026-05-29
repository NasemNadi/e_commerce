import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/helper.dart';
import '../../data/models/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  // ── Login ─────────────────────────────────
  Future<void> loginUser({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.login(email, password);
      if (user != null) {
        if (user.token.isNotEmpty) {
          await Helper.saveToken(user.token);
        }
        emit(AuthSuccess(user));
      } else {
        emit(AuthError('Login failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

// ── Register ──────────────────────────────
  Future<void> registerUser({
    required String name,
    required String username,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.register(
        name: name,
        username: username,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      if (user != null) {
        if (user.token.isNotEmpty) {
          await Helper.saveToken(user.token);
        }
        emit(AuthSuccess(user));
      } else {
        emit(AuthError('Register failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }}