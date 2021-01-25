import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:mds_2021/models/address.dart';
import 'package:mds_2021/models/company.dart';
import 'package:mds_2021/routes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    Company(0, 'Entreprise 1',
        new Address("rue a ", "Angers", "49000", new LatLng(45, -5))),
    Company(0, 'Entreprise 2',
        new Address("rue a ", "Angers", "49000", new LatLng(45, -5))),
    Company(0, 'Entreprise 3',
        new Address("rue a ", "Angers", "49000", new LatLng(45, -5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyDigitalMap"),
      ),
      body: Container(
          child: ListView.separated(
        itemCount: _companies.length,
        itemBuilder: (BuildContext context, int index) {
          Company company = _companies[index];
          return ListTile(
            leading: Icon(Icons.work_outlined),
            title: Text(company?.name ?? 'Entreprise inconnue'),
            onTap: () => print('tap $index ${company.name}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Company company = await Navigator.of(context)
              .pushNamed(Routes.addCompany) as Company;
          if (company != null) {
            setState(() {
              _companies.add(company);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
