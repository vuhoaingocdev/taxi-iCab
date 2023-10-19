import 'package:app_taxi/src/blocs/auth_bloc.dart';
import 'package:app_taxi/src/resources/dialog/loading_dialog.dart';
import 'package:app_taxi/src/resources/dialog/msg_dialog.dart';
//import 'package:app_taxi/src/resources/home_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
   @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isObs = true;

  AuthBloc bloc = new AuthBloc();
  TextEditingController _nameController  = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController  = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  //Gọi hàm dừng Stream
 @override
 void dispose()
 {
   bloc.dispose();
   super.dispose();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // cho màu appbar là màu trùng với màu nền
        elevation: 0,  //bỏ shadow của appbar
        iconTheme: const IconThemeData(color: Color(0xff3277D8)),
        toolbarHeight: 29,
      ),

      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(
            children:  [
              // SizedBox(height: 10),
              const Image(image: AssetImage('assets/icon_car_red.png')),
              
               const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  child: Text(
                      "Welcome Aboard!",
                    style: TextStyle(fontSize: 45, color: Color(0xff333333), fontFamily: 'DancingScript-SemiBold'),
                  ),
              ),

              const Text(
                "Signup with icab with simple steps",
                style: TextStyle(fontSize: 23,color: Color(0xff606470), fontFamily: 'DancingScript-SemiBold'),
              ),

              //Register information
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                  child: StreamBuilder(
                    stream: bloc.nameStream,
                    builder: (context, snapshot) =>
                     TextField(
                       controller: _nameController,
                       onChanged: _onCheckInformationUser(),
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? "${snapshot.error}" : null,
                          labelText: "Name",
                          prefixIcon: Container(
                          height: MediaQuery.of(context).size.height*0.01,
                          child: const Image(image: AssetImage('assets/person.png')),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xffCED0D2)),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                      ),
                    ),
                  ),
              ),

              StreamBuilder(
                stream: bloc.phoneStream,
                builder: (context, snapshot) =>
                TextField(
                  controller: _phoneController,
                  onChanged: _onCheckInformationUser(),
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    errorText: snapshot.hasError ? "${snapshot.error}" : null,
                    prefixIcon: Container(
                      height: 30,
                      child:const  Image(image: AssetImage('assets/ic_phone.jpg'))),

                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(width: 1, color: Color(0xffCED0D2))
                    )
                  ),
                ),
              ),
              
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                   
                  child:  StreamBuilder(
                    stream: bloc.emailStream,
                    builder: (context, snapshot) =>
                    TextField(
                      onChanged: _onCheckInformationUser(),
                      controller: _emailController,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Email",
                        errorText:
                          snapshot.hasError ? "${snapshot.error}" : null,
                        prefixIcon: Container(
                          height: 30,
                          child: const Image(image: AssetImage('assets/icon_email.png')),
                        ),

                        border:const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xffCED0D2)),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                      ),
                    ),
                  ),
              ),

              StreamBuilder(
                stream: bloc.passStream,
                builder: (context, snapshot) =>
                TextField(
                  onChanged: _onCheckInformationUser(),
                  controller: _passController,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  autofocus: false,
                  obscureText: isObs,
                  decoration: InputDecoration(
                    labelText: "Password",
                    errorText:
                      snapshot.hasError ? "${snapshot.error}" : null,
                    prefixIcon: Container(
                      height: 30,
                      child: const Image(image: AssetImage('assets/ic_lock.png')),
                    ),

                    suffixIcon: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isObs = isObs ? false : true;
                        });
                      },

                      child: Icon(isObs ? Icons.visibility : Icons.visibility_off),
                    ),

                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(width: 1, color: Color(0xffCED0D2))
                    )
                  ),
                ),
              ),
              
              Padding(
                  padding:const  EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _onClickSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,

                        side:const BorderSide(width: 1.4, color: Colors.blue),

                        shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))
                        ),
                        
                        elevation: 12,
                        shadowColor: Colors.red.withOpacity(0.5)
                      ),
                      child:const  Text("Sign up", style: TextStyle(color: Colors.black, fontSize: 25)),
                ),
              )
              ),

              //Footer
              Padding(
                  padding:const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: RichText(
                    text: const TextSpan(
                      text: "Already a User?    ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 17),

                      children: <TextSpan>
                       [
                          TextSpan(
                              text: "Login now",
                              style: TextStyle(color: Colors.lightBlue, fontSize: 17)
                          )
                       ]
                    ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Check thông tin người dùng nhập vào có hợp lệ hay không
  _onCheckInformationUser()
  {
       bloc.isValid(_nameController.text, _emailController.text, _passController.text , _phoneController.text);
  }

  //Khi đăng kí user xog thì sẽ chuyển sang màn hình HomePage
  _onClickSignUp()
  {
      var isValid = bloc.isValid(_nameController.text, _emailController.text, _passController.text, _phoneController.text);
      if(isValid)
        {
          //create user
          //loading dialog
          //+thành công thì sẽ đi đến HomePage
          //+Thất bại thì sẽ ẩn dialog đi và in ra thông báo lỗi
          LoadingDialog.showLoadingDialog(context, 'Loading...');
            bloc.signUp(_emailController.text, _passController.text, _nameController.text, _phoneController.text, ()
            {
                   //Thành công
                   LoadingDialog.hideLoadingDialog(context);
                   Navigator.push(
                       context, MaterialPageRoute(builder: (context) => HomePage()));
            }, (msg)
            {
                //Thất bại
                LoadingDialog.hideLoadingDialog(context);

                //in thông báo để user biết lỗi và sửa lỗi
                MsgDialog.showMsgDialog(context, "Sign-In", msg);
            });
        }
  }
}


