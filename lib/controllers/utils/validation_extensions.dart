extension ValidationExtensions on String {
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  bool get isValidPhoneNumber {
    final phoneRegex = RegExp(
      r'^\+?[0-9]{7,15}$',
    );
    return phoneRegex.hasMatch(this);
  }
}
