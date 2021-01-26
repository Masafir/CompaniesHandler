import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Company arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
