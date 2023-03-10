import 'package:flutter/material.dart';
import 'package:project8/providers/listProvider.dart';

class info {
  late String country;
  late String capital;
  late String flag;
  late int id;
  info(this.country, this.capital, this.flag, this.id);
}

class updateProvider extends ChangeNotifier {
  List<info> list1 = [
    info("India", "delhi",
        "https://www.worldatlas.com/r/w425/img/flag/in-flag.jpg", 1),
    info("Bangladesh", "Dhaka",
        "https://www.worldatlas.com/r/w425/img/flag/bd-flag.jpg", 2),
    info("Pakistan", "Islamabad",
        "https://www.worldatlas.com/r/w425/img/flag/in-flag.jpg", 3),
  ];
  late List<info> tempList = list1;
  // TextEditingController countryController = TextEditingController();
  // TextEditingController capitalController = TextEditingController();

  void update(int index, String countryName, String capitalName) {
    list1[index].country = countryName;
    list1[index].capital = capitalName;
    // countryController.text = countryName;
    // capitalController.text = capitalName;
    notifyListeners();
  }

  notifyListeners();
}
