import 'package:chatbox/services/firebase/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          AuthInitial(),
        );

  Future logIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(
        LoginError('Please fill in all fields'),
      );
      return;
    }
    emit(
      LoginLoading(),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        LoginSuccess(),
      );
    } catch (error) {
      emit(
        LoginError(
          error.toString(),
        ),
      );
    }
  }

  Future signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      emit(
        SignUpError('Please fill in all fields'),
      );
      return;
    }
    if (password.length < 6) {
      emit(
        SignUpError('Password must be at least 6 characters'),
      );
      return;
    }
    emit(
      SignUpLoading(),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.reload();
      await FireAuth.createUser();
      emit(
        SignUpSuccess(),
      );
    } catch (error) {
      emit(
        SignUpError(
          error.toString(),
        ),
      );
    }
  }
}
