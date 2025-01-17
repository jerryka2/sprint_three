import 'package:get_it/get_it.dart';
import 'package:third_sp/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:third_sp/features/onboarding/presentation/view_model/cubit/onboard_screen_cubit.dart';
import 'package:third_sp/features/splash/presentation/view_model/cubit/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initSplashScreenDependencies();
  await _initOnBoardScreenDependencies();
  await _initLogInScreenDependencies();
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(),
  );
}

_initOnBoardScreenDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(),
  );
}

_initLogInScreenDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(),
  );
}
