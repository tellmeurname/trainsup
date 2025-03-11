import 'package:trainsup/app/models/user_model.dart';
import 'package:trainsup/features/account/data/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User?> call(String userId) async { // Возвращаемый тип должен быть User?
    return await repository.getUser(userId);
  }
}