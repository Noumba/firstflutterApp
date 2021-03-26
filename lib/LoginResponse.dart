
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/LoginRequest.dart';

abstract class LoginCallback{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginResponse {
  final Function onLoginSuccess;
  final Function onLoginError;
  LoginRequest loginRequest = new LoginRequest();
  LoginResponse(this.onLoginSuccess,this.onLoginError);

  doLogin(String username, String password){
    print('This is the response class');

    loginRequest.getLogin(username, password).then((user) => onLoginSuccess(user))
        .catchError((onError) => onLoginError(onError.toString()));
  }
}