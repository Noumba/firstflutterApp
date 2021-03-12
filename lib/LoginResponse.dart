import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/LoginRequest.dart';

abstract class LoginCallback{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginResponse {
  LoginCallback _callback;
  LoginRequest loginRequest = new LoginRequest();
  LoginResponse(this._callback);

  doLogin(String username, String password){
    loginRequest.getLogin(username, password).then((user) => _callback.onLoginSuccess(user)).catchError((onError) => _callback.onLoginError(onError.toString()));
  }
}