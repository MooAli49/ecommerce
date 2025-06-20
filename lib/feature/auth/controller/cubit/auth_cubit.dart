import 'dart:developer';

import 'package:ecommerce/core/web_service/firestore_user.dart';
import 'package:ecommerce/feature/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreUser _firestoreUser = FirestoreUser();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

      final user = userCredential.user;
      if (user != null) {
        // Save user to Firestore
        final userModel = UserModel(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL ?? '',
        );
        try {
          await _firestoreUser.addUser(userModel);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthError('Failed to add user to Firestore'));
        }
      } else {
        emit(AuthError('Failed to get user data after sign in'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during authentication'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred during sign in'));
    }
  }

  // Uncomment the following code if you want to implement Facebook sign-in
  // Future<void> signInWithFacebook() async {
  //   try {
  //     emit(AuthLoading());
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await _facebookAuth.login();
  //     log('Facebook login triggered');
  //     // Check if the login was successful
  //     log('LoginResult status: ${loginResult.status}');
  //     if (loginResult.status != LoginStatus.success ||
  //         loginResult.accessToken == null) {
  //       emit(
  //         AuthError(
  //           'Facebook login failed: ${loginResult.message ?? "No access token"}',
  //         ),
  //       );
  //       return;
  //     }
  //     log('LoginResult message: ${loginResult.message}');
  //     // If the login was successful, get the access token
  //     final String accessToken = loginResult.accessToken!.tokenString;
  //     log('LoginResult accessToken: ${loginResult.accessToken}');
  //     // Create a credential and sign in to Firebase
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(accessToken);
  //     log('FacebookAuthProvider credential created');
  //     final userCredential = await _firebaseAuth.signInWithCredential(
  //       facebookAuthCredential,
  //     );
  //     log('Firebase sign-in with Facebook completed');
  //     final user = userCredential.user;
  //     log('User after sign-in: ${user?.email}');
  //     if (user != null) {
  //       emit(AuthSuccess(user));
  //     } else {
  //       emit(AuthError('Failed to get user data after sign in'));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     emit(AuthError(e.message ?? 'An error occurred during authentication'));
  //     log('FirebaseAuthException: ${e.message}');
  //   } catch (e, stackTrace) {
  //     emit(AuthError('An unexpected error occurred during sign in'));
  //     log('Facebook sign-in unexpected error: $e');
  //     log('StackTrace: $stackTrace');
  //   }
  // }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during authentication'));
    } catch (e, stackTrace) {
      log('Facebook sign-in unexpected error: $e');
      log('StackTrace: $stackTrace');
      emit(AuthError('An unexpected error occurred during sign in'));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
      ]);
      emit(AuthSignedOut());
    } catch (e) {
      emit(AuthError('Failed to sign out'));
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Update display name in Firebase Auth
      await userCredential.user?.updateDisplayName(name);

      // Create user model for Firestore
      final user = UserModel(
        id: userCredential.user?.uid ?? '',
        name: name,
        email: email,
        photoUrl: userCredential.user?.photoURL ?? '',
      );

      // Save user to Firestore
      await _firestoreUser.addUser(user);

      emit(AuthSuccess(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during authentication'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred during sign up'));
    }
  }

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;
}
