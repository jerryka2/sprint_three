import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);

  /// Triggers navigation after a delay
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(null); // Triggers the navigation in BlocListener
  }
}
