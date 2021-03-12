
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/DbHelper.dart';

class LoginRequest {
  SQLiteDbProvider db = SQLiteDbProvider();
   Future<User> getLogin(String username, String password){
     var result = db.getLogin(username, password);
     return result;
   }
}