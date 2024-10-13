//provider

import 'package:flutter/material.dart';

class BeverageProvider with ChangeNotifier {
  String? _selectedSize;
  String? _selectedSweetness;
  String? _selectedSyrup;
  String? _selectedCondiment;
  String? _selectedFoamTopping;
  String? _selectedTemperature;

  int _selectedEspressoShots = 0;
  int _quantity = 1;

  // Getters and Setters
  String? get selectedSize => _selectedSize;
  set selectedSize(String? value) {
    _selectedSize = value;
    notifyListeners();
  }

  String? get selectedSweetness => _selectedSweetness;
  set selectedSweetness(String? value) {
    _selectedSweetness = value;
    notifyListeners();
  }

  String? get selectedSyrup => _selectedSyrup;
  set selectedSyrup(String? value) {
    _selectedSyrup = value;
    notifyListeners();
  }

  String? get selectedCondiment => _selectedCondiment;
  set selectedCondiment(String? value) {
    _selectedCondiment = value;
    notifyListeners();
  }

  String? get selectedFoamTopping => _selectedFoamTopping;
  set selectedFoamTopping(String? value) {
    _selectedFoamTopping = value;
    notifyListeners();
  }

  String? get selectedTemperature => _selectedTemperature;
  set selectedTemperature(String? value) {
    _selectedTemperature = value;
    notifyListeners();
  }

  int get selectedEspressoShots => _selectedEspressoShots;
  set selectedEspressoShots(int value) {
    _selectedEspressoShots = value;
    notifyListeners();
  }

  int get quantity => _quantity;
  set quantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  // Reset selections
  void resetSelections() {
    _selectedSize = null;
    _selectedSweetness = null;
    _selectedSyrup = null;
    _selectedCondiment = null;
    _selectedFoamTopping = null;
    _selectedTemperature = null;
    _selectedEspressoShots = 0;
    _quantity = 1;
    notifyListeners();
  }
}
