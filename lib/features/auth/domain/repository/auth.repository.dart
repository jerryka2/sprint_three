import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);

  Future<Either<Failure, String>> loginUser(String phone, String password);

  // Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
