import 'package:app_taxi/src/app.dart';
import 'package:app_taxi/src/resources/dialog/loading_dialog.dart';
import 'package:app_taxi/src/resources/dialog/msg_dialog.dart';
import 'package:app_taxi/src/resources/home_page.dart';
import 'package:app_taxi/src/resources/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../blocs/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

 class _LoginPageState extends State<LoginPage> {

  bool isObs = true;

  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passController = TextEditingController();

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints:const  BoxConstraints.expand(), //max width, max height
        color: Colors.white,
        child: SingleChildScrollView(   //tránh che mất view khi build trên thiết bị nhỏ
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children:  [
                  const SizedBox(height: 70),
                  const Image(image: AssetImage('assets/ic_car_black.png')),

                  const Padding(
                      padding:  EdgeInsets.fromLTRB(0, 1, 0, 8),
                      child: Text(
                           "Welcome back!",
                           style: TextStyle(fontSize: 50, color: Color(0xff333333), fontFamily: 'DancingScript-SemiBold'),
                      )
                    ),

                 const Text(
                     "Login to continue using iCab",
                      style: TextStyle(fontSize: 27,color: Color(0xff606470), fontFamily: 'DancingScript-SemiBold'),
                 ),

                  Padding(
                     padding:const  EdgeInsets.fromLTRB(0, 60, 0, 20),
                     child: TextField(
                       style: const TextStyle(fontSize: 17, color: Colors.black ),
                       autofocus: false,
                       onChanged: (val) => email = val,
                       decoration: InputDecoration(
                         labelText: "Email",
                         prefixIcon:  Container(   //prefixIcon: để thêm icon vào textfield
                           width: MediaQuery.of(context).size.height * 0.01,  //đặt kích thước cố định để tránh trường hợp icon to lm dãn input textfield
                           child: const Image( image: AssetImage('assets/icon_email.png'))
                         ),
                         border: const OutlineInputBorder(
                           borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
                           borderRadius: BorderRadius.all(Radius.circular(6)))),
                     ),
                   ),

                 TextField(
                   style: const TextStyle(fontSize: 17, color: Colors.black),
                   obscureText: isObs,
                   autofocus: false,
                   onChanged: (val) => password = val,
                   decoration: InputDecoration(
                     labelText: "Password",

                     prefixIcon: Container(
                         width: MediaQuery.of(context).size.height * 0.01,
                         child: const Image(image: AssetImage('assets/ic_lock.png'))
                     ),

                     suffixIcon: GestureDetector(
                       onTap: (){
                        setState(() {
                          isObs = isObs  ? false : true;
                         });
                       },
                       child:  Icon(isObs ?  Icons.visibility :  Icons.visibility_off),
                     ),

                     border: const OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
                       borderRadius: BorderRadius.all(Radius.circular(6)))),
                 ),

                 Container(
                   width: double.infinity,
                   alignment: AlignmentDirectional.centerEnd,
                   child: const Padding(
                     padding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                     child: Text(
                       "Forgot password?",
                       style: TextStyle(fontSize: 17, color: Color(0xff606470)),
                     ),
                   ),
                 ),

                 //Button
                  Padding(
                     padding:const EdgeInsets.fromLTRB(0, 30, 0, 40),
                     child: SizedBox(
                        width: double.infinity,
                        height: 52,
                       child: ElevatedButton(
                           onPressed: _onLoginClick,
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.orange,
                             shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),

                             elevation: 13,
                             shadowColor: Colors.red.withOpacity(0.5),

                             side:const  BorderSide(width: 1.4, color: Colors.black)
                           ),
                           child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 26),
                           )
                       ),
                   ),
                 ),

                //Footer
                  Padding(
                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                     child: RichText(
                       text:  TextSpan(
                         text: "New user?   ",
                         style: const TextStyle(color: Color(0xff606470), fontSize: 17),
                         children: <TextSpan>[
                           TextSpan(
                             recognizer: TapGestureRecognizer()
                                 ..onTap = ()
                                 {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>RegisterPage()
                                       )
                                   );
                                 },

                             text: "Sign up for a new account",
                             style:const  TextStyle(color: Colors.lightBlue, fontSize: 17)
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

  //Khi user click vào login_page
 void _onLoginClick()
 {
     var bloc = MyApp.of(context)?.bloc;
     LoadingDialog.showLoadingDialog(context, "Loading...");
     bloc?.signIn(email, password, ()
     {
       LoadingDialog.hideLoadingDialog(context);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
       }, (msg)
     {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, "Sign-In", msg);
     });
 }
}


