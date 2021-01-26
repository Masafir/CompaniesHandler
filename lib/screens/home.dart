import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:mds_2021/models/address.dart';
import 'package:mds_2021/models/company.dart';
import 'package:mds_2021/repositories/preference_repository.dart';
import 'package:mds_2021/routes.dart';
import 'package:mds_2021/tabs/list_tab.dart';
import 'package:mds_2021/tabs/map_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  PreferenceRepository _preferenceRepository = new PreferenceRepository();
}

class _HomeState extends State<Home> {
  List<Company> _companies = [];
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    widget._preferenceRepository
        .loadCompanies()
        .then((value) => _companies = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("MyDigitalMap"),
      ),
      body: IndexedStack(
        index: _index,
        children: [
          ListTab(companies: _companies),
          MapTab(companies: _companies),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Company company = await Navigator.of(context)
              .pushNamed(Routes.addCompany) as Company;
          if (company != null) {
            setState(() {
              _companies.add(company);
            });
            widget._preferenceRepository.saveCompanies(_companies);
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "Entreprises"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Carte")
        ],
        onTap: (value) => setState(() {
          _index = value;
        }),
      ),
    );
    return scaffold;
  }
}
