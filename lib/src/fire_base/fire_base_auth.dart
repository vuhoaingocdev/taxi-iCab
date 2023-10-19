//Trong file này có nhiệm vụ tạo thông tin user và tạo node user trong database và ghi thông tin user vào database

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class FirAuth{

  //Để tạo user trên firebase ta dùng FirebaseAuth

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


//Đăng kí tài khoản user
// hàm tạo user thông qua đăng kí, nếu thành công sẽ gọi tiếp tạo user trên database
  void signUp(String email, String pass, String name, String phone, Function onSuccess, Function(String) onRegisterError)
  {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user){

      _createUser(user.user?.uid ??"", name, phone, onSuccess, onRegisterError);

      print(user);

    }).catchError((err){
      //catch dùng trong trường hợp lỗi network, mật khẩu yếu, email không hợp lệ
      _onSignUpErr(err.code, onRegisterError);
    });
  }

  //Lúc tạo user thành công thì user chỉ có thông tin email và password, muốn lưu thêm thông tin thì ta tạo node user trên database
  //Hàm tạo thông tin và ghi 2 thông tin name, phone trên database của firebase
    _createUser(String userId, String name, String phone, Function onSuccess, Function(String) onRegisterError) {
    var user = { "name": name, "phone": phone };

    var ref = FirebaseDatabase.instance.reference().child("users");

    //Tạo 1 user id trong đó sẽ chứa thông tin của user
    ref.child(userId).set(user).then((user)
    {
      //success
      onSuccess();   //nếu thành công thì sẽ nhảy vào page chỉ định
    }).catchError((err){
      onRegisterError("SignUp fail, please try again");
    });
  }

  //Đăng nhập tài khoản sau khi đã đăng kí tài khoản hợp lệ
  void SignIn(String email, String pass, Function onSuccess, Function(String) onSignInError)
  {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass)
        .then((user)
    {
      print("Sign in success");
      onSuccess();

    }).catchError((err){
      print("Lỗi: "+ err.toString());
      onSignInError("Sign-In fail, please try again..");
    });
  }

  //Hàm hiện thông báo lỗi đăng nhập, đăng kí
  void _onSignUpErr(String code, Function(String) onRegisterError)
  {
    switch(code)
    {
      case "invalid-email":
        onRegisterError("Invalid email");
        break;

      case "email-already-in-use":
        onRegisterError("Email has existed");
        break;

      case "weak-password":
        onRegisterError("The password is not strong enough");
        break;

      default:
        onRegisterError("Sign fail, please try again");
        break;
    }
  }
}
