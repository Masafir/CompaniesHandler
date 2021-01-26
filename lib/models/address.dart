import 'dart:convert';

import 'package:latlong/latlong.dart';

class Address {
  String city;
  String postcode;
  LatLng position;
  String street;
  String name;

  Address(this.street, this.city, this.postcode, this.position);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    //print('Add new feature : ${json}');
    Map<String, dynamic> properties = json['properties'] ?? {};
    Map<String, dynamic> geometries = json['geometry'] ?? {};
    List<dynamic> coordinates = geometries['coordinates'] ?? {};
    //print(json);
    //print(geometries);
    //print(coordinates);
    String street = properties['name'];
    String postcode = properties['postcode'];
    String city = properties['city'];
    LatLng position = new LatLng(coordinates[1], coordinates[0]);
    //print(' new Address added $street $postcode  $city $position');
    // ...
    return Address(street, postcode, city, position);
  }
  String toJson() {
    return jsonEncode({
      'street': this.street,
      'city': this.city,
      'postcode': this.postcode,
      'latitude': this.position.latitude,
      'longitude': this.position.longitude,
    });
  }

  factory Address.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Address(
        map['street'] as String,
        map['city'] as String,
        map['postcode'] as String,
        LatLng(map['latitude'] as num, map['longitude'] as num));
  }

  String fullName() {
    return "$street, $postcode $city";
  }
}
