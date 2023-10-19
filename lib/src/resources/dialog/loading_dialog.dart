import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDialog(BuildContext context, String msg)
  {
      showDialog(
          context: context,
          barrierDismissible: false, //Khi người dùng click ra ngoài dialog thì dialog sẽ không bị ẩn đi
          builder: (context)=> Dialog(
            child:  Container(
              color: Colors.white,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                     const CircularProgressIndicator(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(msg, style: const TextStyle(fontSize: 18),),
                    )
                ],
              ),
            ),
          ));
    }

    //Trong material dùng hàm Navigator để push hàm showdialog vào thì bên dưới hàm hideLoadingDialog ta dùng pop để đẻ lấy nó ra
    //Hàm ẩn loading
    static void hideLoadingDialog(BuildContext context)
    {
        Navigator.of(context).pop(LoadingDialog);
    }
}