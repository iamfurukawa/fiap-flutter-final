enum RegisterCubitStateStatus { ok, register, error }

class RegisterCubitState {
  final RegisterCubitStateStatus status;
  final String? email;
  final String? password;
  final String? error;

  const RegisterCubitState({
    required this.status,
    this.email,
    this.password,
    this.error,
  });

  RegisterCubitState copyWith({
    RegisterCubitStateStatus? status,
    String? email,
    String? password,
    String? error,
  }) {
    return RegisterCubitState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }
}
