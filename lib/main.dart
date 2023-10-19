import 'package:app_taxi/src/app.dart';
import 'package:app_taxi/src/blocs/auth_bloc.dart';
import 'package:app_taxi/src/resources/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 runApp( MyApp(
     new AuthBloc(),
     MaterialApp(
      home: LoginPage(),
     debugShowCheckedModeBanner: false),
   ),
 );
}

