import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_profile.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
    GoogleSignIn.instance,
  );
});

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthRepository(this._auth, this._firestore, this._googleSignIn);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<UserProfile?> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return UserProfile.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  Future<void> signInWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final user = cred.user;
    if (user != null) {
      final profile = UserProfile(
        uid: user.uid,
        email: email,
        name: name,
        role: role,
        createdAt: DateTime.now(),
      );
      await _firestore.collection('users').doc(user.uid).set(profile.toMap());
      await user.sendEmailVerification();
    }
  }

  Future<bool> signInWithGoogle({UserRole? newRole}) async {
  await _googleSignIn.initialize();

  final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

  final GoogleSignInAuthentication googleAuth =
      googleUser.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
  );

  final cred = await _auth.signInWithCredential(credential);
  final user = cred.user;

  if (user != null) {
    final existingProfile = await getUserProfile(user.uid);

    if (existingProfile == null) {
      final profile = UserProfile(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? 'Google User',
        role: newRole ?? UserRole.student,
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(profile.toMap());
    }

    return true;
  }

  return false;
}

  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
