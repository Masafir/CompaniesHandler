import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mds_2021/models/address.dart';

class Company {
  int id;
  String name;
  Address address;

  Company(this.id, this.name, this.address);

  String toJson() {
    return jsonEncode(
        {'id': this.id, 'name': this.name, 'address': this.address.toJson()});
  }

  factory Company.fromJson(String json) {
    Map<String, dynamic> companies = jsonDecode(json);
    return Company(companies["id"] as int, companies["name"] as String,
        Address.fromJson(companies["address"]));
  }
}
