enum SignInCubitStateStatus { ok, logged, error }

class SignInCubitState {
  final SignInCubitStateStatus status;
  final String? email;
  final String? password;
  final String? error;

  const SignInCubitState({
    required this.status,
    this.email,
    this.password,
    this.error,
  });

  SignInCubitState copyWith({
    SignInCubitStateStatus? status,
    String? email,
    String? password,
    String? error,
  }) {
    return SignInCubitState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }
}
