import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:third_sp/features/auth/presentation/view_model/login/bloc/login_event.dart';
import 'package:third_sp/features/auth/presentation/view_model/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
  }
}
