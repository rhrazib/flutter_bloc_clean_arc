import '../entities/user.dart';
import '../repositories/auth_repository.dart';
// The use case represents a single business operation.
// In this case, the Login use case is responsible for executing the login operation through the repository.
class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<User> call(
      String email,
      String password,
      ) {
    return repository.login(email, password);
  }
}