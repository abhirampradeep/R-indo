class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('enter strong password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('enter valid email');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exist for that email');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
