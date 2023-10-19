import 'dart:async';

import 'package:app_taxi/src/resources/widgets/home_menu.dart';
import 'package:app_taxi/src/resources/widgets/ride_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _scaffoldKey =  GlobalKey<ScaffoldState>(); //khai báo để gán key cho scaffold

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          constraints:const BoxConstraints.expand(),
          color: Colors.white,
          child: Stack(
            children:  [
              //Bản đồ
              const GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(10.7915178, 106.7271422),//tọa độ ban đầu
                    zoom: 14.4746, // độ phóng to ban đầu
                  )
              ),

              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        title:  const Center(
                          child: Text(
                            "Taxi App",
                            style: TextStyle(color: Colors.black, fontFamily: "Times New Roman", fontWeight: FontWeight.bold),
                          ),
                        ),

                        leading: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                          ),
                          onPressed: ()
                          {
                              print("click menu");
                              //Khi click vào thì mở menu
                             _scaffoldKey.currentState?.openDrawer();
                          },
                           child: const Image(image: AssetImage("assets/ic_menu.png"),)),

                           actions: <Widget> [Image.asset("assets/ic_notify.png")],
                      ),

                      Padding(
                          padding:  const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: RidePicker(),
                      )
                    ],
                  )
              )
            ],
          ),
        ),

        //Gọi đến hàm home_menu
        drawer: Drawer(
          child: HomeMenu(),
        ),

      );
   }
}
