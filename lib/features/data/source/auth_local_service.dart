

import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
}

class AuthLocalServiceImp implements AuthLocalService {
  @override
  Future<bool> isLoggedIn() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    if (token  == null ){
      return false ;
    }else {
      return true;
    }
  }
}