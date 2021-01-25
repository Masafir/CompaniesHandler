import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:mds_2021/models/address.dart';
import 'package:mds_2021/repositories/repository.dart';

class SearchAddress extends StatefulWidget {
  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [
    Address('Place du Ralliement', 'Angers', '49000',
        new LatLng(47.471344, -0.551602)),
    Address('19 rue André le Notre', 'Angers', '49066',
        new LatLng(47.475735, -0.607312)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Recherche d'entreprise")),
        body: Container(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Adresse de l'entreprise"),
              onChanged: (value) async {
                List<Address> newAddresses =
                    await Repository.searchAddresses(value);

                setState(() {
                  _addresses = newAddresses;
                });
              },
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _addresses.length,
                itemBuilder: (BuildContext context, int index) {
                  Address address = _addresses[index];
                  return ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text(
                        '${address?.street ?? 'Adresse inconnue'},${address?.city ?? ''}'),
                    onTap: () => Navigator.pop<Address>(context, this);
                    ,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 0,
                  );
                },
              ),
            )
          ]),
        ));
  }
}
