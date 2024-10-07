class SignInParams {
  final String email;
  final String password;

  bool isEmpty() => email.isEmpty || password.isEmpty;

  bool isNotEmpty() => email.isNotEmpty && password.isNotEmpty;

  SignInParams({required this.email, required this.password});
}

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams(
      {required this.email, required this.password, required this.name});
}
