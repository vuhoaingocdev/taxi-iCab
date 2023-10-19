import 'package:app_taxi/src/blocs/place_bloc.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _addressController;


  @override
  void initState() {
    _addressController = TextEditingController(text: "");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xfff8f8f8),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 60,
                          child: Center(
                            child: Image(image: AssetImage("assets/ic_location_black.png")),
                          ),
                        ),

                        Positioned(
                            right: 0,
                            top: 0,
                            height: 60,
                            width: 40,
                            child: Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                                ),
                                  onPressed: (){
                                    _addressController.text =  "";
                                  },
                                  child: const Image(image: AssetImage("assets/ic_remove_x.png"),)
                              ),
                            )
                        ),

                        Padding(
                            padding: const EdgeInsets.only(left: 40, right: 50),
                            child: TextField(
                              controller: _addressController,
                              textInputAction: TextInputAction.search, //lệnh cho phép tìm kiếm trên textField
                              onSubmitted: (str){
                                // Thaays loois chuwa roi, fix dc khong ko , oke
                                print(str);
                              },
                              style:
                                  const TextStyle(fontSize: 16, color: Color(0xff323643)),
                            ),

                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

    );
  }
}


