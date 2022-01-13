extension ContainsSpecialChars on String {
  bool get containsEspecialChars => contains(RegExp(r'[!@#$%^&*()":{}|<>]'));
}
