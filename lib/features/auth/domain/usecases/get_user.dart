import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entity/user.dart';
import '../repositories/auth_repository.dart';

class GetUser extends NoParamsUseCase<User> {
  AuthRepository repository;
  GetUser({
    required this.repository,
  });
  @override
  Future<Either<Failure, User>> call() async {
    return repository.getUser();
  }
}

// final getAuthDataUseCaseProvider = Provider.autoDispose<GetUser>((ref) {
//   return GetUser(
//     repository: ref.watch(authRepositoryProvider),
//   );
// });
