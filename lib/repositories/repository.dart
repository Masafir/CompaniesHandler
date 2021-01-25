import 'package:mds_2021/models/address.dart';
import 'package:mds_2021/repositories/address_repository.dart';

class Repository {
  static Future<List<Address>> searchAddresses(String query) {
    Future<List<Address>> searchedAddress =
        AddressRepository.fetchAddresses(query) ?? [];
    return searchedAddress;
  }
}
