
import 'package:flutter/material.dart';
import '../blocs/place_bloc.dart';
import '../model/place_item_res.dart';
import '../repository/place_service.dart';

class RidePickerPage extends StatefulWidget {
   // String selectedAddress;
   // Function(PlaceItemRes, bool) onSelected;
   // bool isFromAddress;
   // RidePickerPage({required this.selectedAddress, required this.onSelected, required this.isFromAddress});

  // RidePickerPage({Key: key}) : super(key: key);

  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState() {
    _addressController = TextEditingController(text: "");
    super.initState();
    }

  @override
  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color(0xfff8f8f8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:  Container(
                    width: double.infinity,
                    height: 60,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: 60,
                          child: Center(
                            child: Image.asset("assets/ic_location_black.png"),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 60,
                          child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  _addressController.text = "";
                                },
                                child: Image.asset("assets/ic_remove_x.png")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 50),
                          child: TextField(
                            controller: _addressController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (str) {
                              placeBloc.searchPlace(str);
                            },
                            style:
                                  const TextStyle(fontSize: 16, color: Color(0xff323643)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: StreamBuilder(
                    stream: placeBloc.placeStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print("print: "+snapshot.data.toString());
                        if (snapshot.data == "start") {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        print(snapshot.data.toString());
                        List<PlaceIterRes> places = snapshot.data;
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(places.elementAt(index).name),
                                subtitle: Text(places.elementAt(index).formattedAddress),
                                onTap: () {
                                  print("on tap");
                                },
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              color: Color(0xfff5f5f5),
                            ),
                            itemCount: places.length);
                      } else {
                        return Container();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}