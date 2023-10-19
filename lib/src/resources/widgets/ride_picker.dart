import 'package:app_taxi/src/resources/page_search.dart';
import 'package:flutter/material.dart';

import '../ride_picker_page.dart';

class RidePicker extends StatefulWidget {
  @override
  State<RidePicker> createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.white,
      //       offset: Offset(0,5),
      //       blurRadius: 5.0
      //     )
      //   ]
      // ),
      
      child: Column(
        children: [

          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RidePickerPage()));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children:  const [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image(image: AssetImage("assets/ic_location_black.png")),
                      ),
                    ),
                    
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image(image: AssetImage("assets/ic_remove_x.png"),),
                      ),
                    ),

                    Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text("219 Lĩnh Nam, Hoàng Mai, Hà Nội",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: Color(0xff323643), fontFamily: "Times New Roman")),
                    )
                  ],
                ),
              ),
            ),
          ),


          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
              ),
              onPressed: (){},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children:  const [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image(image: AssetImage("assets/ic_map_nav.png")),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image(image: AssetImage("assets/ic_remove_x.png"),),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text("Home",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, color: Color(0xff323643), fontFamily: "Times New Roman")),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
