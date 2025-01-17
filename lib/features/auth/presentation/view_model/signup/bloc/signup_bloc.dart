import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_sp/features/auth/presentation/view_model/signup/bloc/signup_event.dart';
import 'package:third_sp/features/auth/presentation/view_model/signup/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SubmitSignUp>((event, emit) async {
      emit(SignUpLoading());

      await Future.delayed(
          const Duration(seconds: 2)); // Simulate network delay

      if (event.username.isEmpty ||
          event.email.isEmpty ||
          event.password.isEmpty) {
        emit(SignUpFailure('Please fill all fields'));
        return;
      }

      // Mock successful sign-up
      emit(SignUpSuccess('Account created successfully!'));
    });
  }
}
