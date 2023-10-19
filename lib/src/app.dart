import 'package:app_taxi/src/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';

/*InheritedWidget: là widget cho phép nhiều widget con của
nó truy cập vào để lấy thông tin*/

class MyApp extends InheritedWidget {

  final AuthBloc bloc;
  final Widget child;

  MyApp(this.bloc, this.child) : super( child: child);

  @override
  bool updateShouldNotify( covariant InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}


