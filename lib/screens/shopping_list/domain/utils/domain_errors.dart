enum DomainError {
  errorOnSave;

  String get description {
    switch (this) {
      case DomainError.errorOnSave:
        return 'Erro na sincronização com o Firestore!';
      default:
        return 'Erro desconhecido!';
    }
  }
}