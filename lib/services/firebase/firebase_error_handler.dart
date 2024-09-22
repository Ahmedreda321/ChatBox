String getFirebaseAuthErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'auth/app-deleted':
      return 'The app was not found.';
    case 'auth/expired-action-code':
      return 'The action code or link has expired.';
    case 'auth/invalid-action-code':
      return 'The action code is invalid. This may happen if the code is malformed or has already been used.';
    case 'auth/user-disabled':
      return 'The user corresponding to the given credential has been disabled.';
    case 'auth/user-not-found':
      return 'The user does not exist or does not match any credentials.';
    case 'auth/weak-password':
      return 'The password is too weak.';
    case 'auth/email-already-in-use':
      return 'An account already exists with the provided email address.';
    case 'auth/invalid-email':
      return 'The email address is not valid.';
    case 'auth/operation-not-allowed':
      return 'The account type corresponding to this credential is not yet enabled.';
    case 'auth/account-exists-with-different-credential':
      return 'Email already associated with a different account.';
    case 'auth/wrong-password':
      return 'Incorrect password.';
    case 'auth/invalid-verification-code':
      return 'The verification code is invalid.';
    case 'auth/network-request-failed':
      return 'Network connection failed.';
    case 'auth/too-many-requests':
      return 'Requests have been blocked due to unusual activity. Please try again later.';
    default:
      return 'An undefined error occurred.';
  }
}
