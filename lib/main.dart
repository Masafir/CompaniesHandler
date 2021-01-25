import 'package:flutter/material.dart';
import 'package:mds_2021/routes.dart';
import 'package:mds_2021/screens/add_company.dart';
import 'package:mds_2021/screens/home.dart';
import 'package:mds_2021/screens/search_address.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Routes.addCompany: (context) => AddCompany(),
        Routes.searchAddress: (context) => SearchAddress()
      },
      home: Home(),
    );
  }
}
