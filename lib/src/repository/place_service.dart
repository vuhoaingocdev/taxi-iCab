
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceIterRes {
  // Định nghĩa các thuộc tính cần thiết cho lớp PlaceIterRes
  // Ví dụ:
  String businessStatus;
  String formattedAddress;
  String name;

  // Constructor
  PlaceIterRes({required this.businessStatus, required this.formattedAddress, required this.name});

  // Factory method để tạo một đối tượng PlaceIterRes từ JSON
  factory PlaceIterRes.fromJson(Map<String, dynamic> json) {
    return PlaceIterRes(
    businessStatus: json['business_status'] ?? "",
    formattedAddress: json['formatted_address'] ?? "",
        name : json['name'] ?? ""
    );
  }
}


class AddressResponse{
  late List<PlaceIterRes> results;

  AddressResponse({required this.results});

  AddressResponse.fromJson(Map<String, dynamic> json){
    if(json != null){
      results = <PlaceIterRes>[];
      // json['results'].foreach((v){
      //   results.add(PlaceIterRes.fromJson(v));
      // });
      for(var item in json['results']){
        results.add(PlaceIterRes.fromJson(item));
      }
    }
  }


}


class Configs {
  static const String ggKEY2 = 'AIzaSyByiywKCa3NdVArMk1SDBu03OFAFO1SALg'; // Thay YOUR_API_KEY bằng khóa API của bạn // Key dau// chua dung den key ddo cai do luc code file nay loi thif n yeu cau ne hoi chat gpt n ethem vao thoi
}

class PlaceService{
  static Future<Object> searchPlace(String keyword) async{
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query="+  Uri.encodeQueryComponent(keyword) +"&key=" + Configs.ggKEY2;

    print("search >>: "+url);
    Uri api = Uri.parse(url);
    var res = await http.get(api);
    if(res.statusCode == 200)
    {
        var data =  AddressResponse.fromJson(json.decode(res.body));
        return data.results;
    }
    else
      {
        return [];
      }
  }
}



