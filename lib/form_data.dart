
enum AuthMode { 
Signup, 
Login }

class FormData {
  String email = '';
  String password = '';
  String name = '';
  AuthMode _mode = AuthMode.Login;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSignup {
    return _mode == AuthMode.Signup;
  }

  void toggleMode() {
    _mode = isLogin ? AuthMode.Signup : AuthMode.Login;
  }
}
