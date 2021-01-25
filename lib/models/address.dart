import 'package:latlng/latlng.dart';

class Address {
  String city;
  String postcode;
  LatLng position;
  String street;
  String name;

  Address(this.street, this.city, this.postcode, this.position);

  factory Address.fromJson(Map<String, dynamic> json) {
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
}
