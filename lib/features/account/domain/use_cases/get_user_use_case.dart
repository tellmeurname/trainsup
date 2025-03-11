import 'package:trainsup/features/account/data/repositories/user_repository.dart';
import 'package:trainsup/app/models/user_model.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User?> call(String userId) async {
    return await repository.getUser(userId);
  }
}