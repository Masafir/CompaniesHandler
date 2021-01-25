import 'dart:convert';

import 'package:http/http.dart';
import 'package:mds_2021/models/address.dart';

class AddressRepository {
  static Future<List<Address>> fetchAddresses(String query) async {
    //print('Fet addesses');
    Response response =
        await get('https://api-adresse.data.gouv.fr/search/?q=$query');
    if (response.statusCode == 200) {
      //print('Response 200 yay');
      List<Address> addresses = [];

      Map<String, dynamic> json = jsonDecode(response.body);
      //print(json);
      if (json.containsKey("features")) {
        List<dynamic> features = json['features'];
        //print("json contain feature");
        features.forEach((feature) {
          //print('new feature appear ${feature}');
          addresses.add(Address.fromJson(feature));
        });
      }
      //print(addresses);
      return addresses;
    } else {
      //print('Response 404 not yay');
      throw Exception("Failed to load addresses");
    }
  }
}
