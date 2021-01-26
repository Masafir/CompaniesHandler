import 'package:shared_preferences/shared_preferences.dart';

import '../models/company.dart';

class PreferenceRepository {
  Future<void> saveCompanies(List<Company> companies) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> list = [];
    companies.forEach((company) {
      String jsonCompany = company.toJson();
      list.add(jsonCompany);
    });
    pref.setStringList("companies", list);
  }

  Future<List<Company>> loadCompanies() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> companyJsonList = pref.getStringList("companies");
    List<Company> companyList = [];

    companyJsonList.forEach((json) {
      Company loadedCompany = Company.fromJson(json);
      companyList.add(loadedCompany);
    });
    return companyList;
  }
}
