import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/entities/user_profile.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return null;
  return ref.watch(authRepositoryProvider).getUserProfile(user.uid);
});

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(() {
  return AuthController();
});

class AuthController extends AsyncNotifier<void> {
  late final AuthRepository _repository;

  @override
  Future<void> build() async {
    _repository = ref.watch(authRepositoryProvider);
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.signInWithEmail(email, password));
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.signUpWithEmail(
          email: email,
          password: password,
          name: name,
          role: role,
        ));
  }

  Future<void> signInWithGoogle({UserRole? role}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final success = await _repository.signInWithGoogle(newRole: role);
      if (!success) {
        throw Exception('Google Sign-In was aborted.');
      }
    });
  }

  Future<void> resetPassword(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.resetPassword(email));
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.signOut());
  }
}
