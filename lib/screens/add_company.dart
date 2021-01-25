import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:mds_2021/models/address.dart';
import 'package:mds_2021/models/company.dart';

import '../routes.dart';

class AddCompany extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajouter une entreprise"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) =>
                      value.isEmpty ? 'Le nom ne doit pas être vide' : null,
                  controller: _nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.apartment),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Nom de l'entreprise"),
                ),
              ),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'Le nom ne doit pas être vide' : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Adresse de l'entreprise"),
                onTap: () async {
                  Navigator.of(context).pushNamed(Routes.searchAddress);
                },
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          label: Text('Annuler'),
                          icon: Icon(Icons.cancel_outlined)),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (this._formKey.currentState.validate()) {
                            String name = this._nameController.text;

                            Company company = Company(0, name,
                                new Address("a", "b", "c", new LatLng(0, 0)));
                            Navigator.pop<Company>(context, company);
                          }
                        },
                        label: Text('Valider'),
                        icon: Icon(Icons.check),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
