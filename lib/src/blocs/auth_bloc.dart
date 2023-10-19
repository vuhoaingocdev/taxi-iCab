

import 'dart:async';

import '../fire_base/fire_base_auth.dart';

class AuthBloc
{
  var _firAuth = FirAuth();

  // StreamController => đẩy event thông báo sang trang đăng kí xem có hiển thị lỗi hay không
  final StreamController _nameController = StreamController();
  final StreamController _emailController =  StreamController();
  final StreamController _passController =  StreamController();
  final StreamController _phoneController =  StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;


  bool isValid(String name, String  email, String pass, String phone)
  {
      if(name == null || name.length == 0)
        {
          _nameController.sink.addError("Nhập tên!");
             return false;
        }
          _nameController.sink.add("");


        if(phone == null || phone.length == 0)
        {
          _phoneController.sink.addError("Nhập số điện thoại!");
          return false;
        }

        _phoneController.sink.add("");


      if(email == null || email.length == 0)
        {
          _emailController.sink.addError("Nhập email!");
          return false;
        }
           _emailController.sink.add("");


      if(pass == null || pass.length < 6 || !pass.contains("@"))
        {
          _passController.sink.addError("Mật khẩu phải trên 5 kí tự và phải chưa kí tự @!");
          return false;
        }
          _passController.sink.add("");

        return true;
  }

  //tạo hàm signup vì bên màn hình đăng kí chỉ làm việc thông qua file auth_bloc, còn việc gọi firebase là việc của bloc
  void signUp(String email, String pass, String name, String phone, Function onSuccess, Function(String) onRegisterError)
  {
      _firAuth.signUp(email, pass, name, phone, onSuccess, onRegisterError);
  }

  //Hàm đăng nhập tài khoản sau khi đã có tài khoản
  void signIn(String email, String pass, Function onSuccess, Function(String) onSignInError)
  {
      _firAuth.SignIn(email, pass, onSuccess, onSignInError);
  }

  //Hàm dispose để clode Stream
  void dispose()
  {
    _nameController.close();
    _passController.close();
    _emailController.close();
    _phoneController.close();
  }
}