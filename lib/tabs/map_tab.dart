import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

import '../models/company.dart';

class MapTab extends StatelessWidget {
  const MapTab({
    Key key,
    @required List<Company> companies,
  })  : _companies = companies,
        super(key: key);

  final List<Company> _companies;

  @override
  Widget build(BuildContext context) {
    List<Marker> _markers = setupMarker(_companies);
    return Scaffold(
      body: Container(
          child: FlutterMap(
        options: new MapOptions(
          center: new LatLng(47.4699, -0.5528),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(
            markers: _markers,
          ),
        ],
      )),
    );
  }

  List<dynamic> setupMarker(List<Company> elements) {
    List<Marker> _newList = [];
    elements.forEach((company) {
      print(company.address.fullName());
      Marker _newMarker = new Marker(
        width: 80.0,
        height: 80.0,
        point: company.address.position,
        builder: (ctx) => new Container(
          child: Icon(Icons.location_on),
        ),
      );
      _newList.add(_newMarker);
    });
    return _newList;
  }
}
