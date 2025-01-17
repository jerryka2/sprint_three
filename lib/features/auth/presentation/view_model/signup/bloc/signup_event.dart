import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitSignUp extends SignUpEvent {
  final String username;
  final String email;
  final String password;

  SubmitSignUp(this.username, this.email, this.password);

  @override
  List<Object?> get props => [username, email, password];
}
