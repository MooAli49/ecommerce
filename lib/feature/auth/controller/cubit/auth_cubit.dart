import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    // Check if user is already signed in
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthSignedOut());
      }
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      emit(AuthLoading());

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        emit(AuthError('Sign in was cancelled by the user'));
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      if (userCredential.user != null) {
        emit(AuthSuccess(userCredential.user!));
      } else {
        emit(AuthError('Failed to get user data after sign in'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during authentication'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred during sign in'));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
      emit(AuthSignedOut());
    } catch (e) {
      emit(AuthError('Failed to sign out'));
    }
  }

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;
}
