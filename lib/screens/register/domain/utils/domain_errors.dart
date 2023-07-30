enum DomainError {
  weakPassword,
  invalidEmail,
  operationNotAllowed,
  emailAlreadyInUse,
  failedToCreateUser;

  String get description {
    switch (this) {
      case DomainError.weakPassword:
        return 'Senha muito fraca!';
      case DomainError.invalidEmail:
        return 'Email inválido!';
      case DomainError.operationNotAllowed:
        return 'Operação não permitida!';
      case DomainError.emailAlreadyInUse:
        return 'Email já em uso!';
      default:
        return 'Erro ao criar usuário!';
    }
  }
}
