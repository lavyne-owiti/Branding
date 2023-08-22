import '../../domain/entity/user.dart';
import '../model/user_model.dart';

extension UserExtension on UserModel {
  User toEntity() => User(
        email: email,
        name: name,
      );
}

extension UserModelExtension on User {
  UserModel toModel() => UserModel(
        email: email,
        name: name,
      );
}
