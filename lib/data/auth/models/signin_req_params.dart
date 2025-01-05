
class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }
}