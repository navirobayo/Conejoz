class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Invalid email format');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure('User account disabled');
      case 'user-not-found':
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
            'Invalid email or password');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
