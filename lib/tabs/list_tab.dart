import 'package:flutter/material.dart';

import '../models/company.dart';
import '../routes.dart';

class ListTab extends StatelessWidget {
  const ListTab({
    Key key,
    @required List<Company> companies,
  })  : _companies = companies,
        super(key: key);

  final List<Company> _companies;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemCount: _companies.length,
      itemBuilder: (BuildContext context, int index) {
        Company company = _companies[index];
        return ListTile(
          leading: Icon(Icons.work_outlined),
          title: Text(company?.name ?? 'Entreprise inconnue'),
          subtitle: Text(company?.address.fullName() ?? 'Adresse invalide'),
          onTap: () => Navigator.pushNamed(context, Routes.companyProfile,
              arguments: company),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 0,
        );
      },
    ));
  }
}
