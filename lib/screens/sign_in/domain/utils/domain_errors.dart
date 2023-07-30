enum DomainError {
  userDisabled,
  invalidEmail,
  userNotFound,
  wrongPassword,
  failedToSignIn;

  String get description {
    switch (this) {
      case DomainError.userDisabled:
        return 'Usuário inativo!';
      case DomainError.invalidEmail:
        return 'Email inválido!';
      case DomainError.userNotFound:
        return 'Usuário não encontrado!';
      case DomainError.wrongPassword:
        return 'Senha inválida!';
      default:
        return 'Falha ao logar!';
    }
  }
}