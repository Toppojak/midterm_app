//provider

import 'package:flutter/material.dart';

class BeverageProvider extends ChangeNotifier {
  // State variables
  String? _menuName;
  String? _category;
  String? _size;
  String? _sweetness;
  String? _syrup;
  String? _condiment;
  String? _foamTopping;
  String? _temperature;
  int _espressoShots = 0;
  int _quantity = 1;

  // Getters
  String? get menuName => _menuName;
  String? get category => _category;
  String? get size => _size;
  String? get sweetness => _sweetness;
  String? get syrup => _syrup;
  String? get condiment => _condiment;
  String? get foamTopping => _foamTopping;
  String? get temperature => _temperature;
  int get espressoShots => _espressoShots;
  int get quantity => _quantity;

  // Setters (with notifyListeners() to update UI when the state changes)
  void setMenuName(String menuName) {
    _menuName = menuName;
    notifyListeners();
  }

  void setCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void setSize(String size) {
    _size = size;
    notifyListeners();
  }

  void setSweetness(String sweetness) {
    _sweetness = sweetness;
    notifyListeners();
  }

  void setSyrup(String syrup) {
    _syrup = syrup;
    notifyListeners();
  }

  void setCondiment(String condiment) {
    _condiment = condiment;
    notifyListeners();
  }

  void setFoamTopping(String foamTopping) {
    _foamTopping = foamTopping;
    notifyListeners();
  }

  void setTemperature(String temperature) {
    _temperature = temperature;
    notifyListeners();
  }

  void setEspressoShots(int espressoShots) {
    _espressoShots = espressoShots;
    notifyListeners();
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
    notifyListeners();
  }

  // Reset all selections
  void resetSelections() {
    _menuName = null;
    _category = null;
    _size = null;
    _sweetness = null;
    _syrup = null;
    _condiment = null;
    _foamTopping = null;
    _temperature = null;
    _espressoShots = 0;
    _quantity = 1;
    notifyListeners();
  }

  void selectBeverage(String name, String category) {
    _menuName = name;
    _category = category;
    notifyListeners();
  }
}
