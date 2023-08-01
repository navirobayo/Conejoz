class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unkown error ocurred"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a valid email');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'This email is registered already');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation not allowed');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'The account was disabled. Contact support. ');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
