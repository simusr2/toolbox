import 'package:flutter/material.dart';
import 'package:toolbox/model/NavigationItem.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.people;

  NavigationItem get navigationItem => _navigationItem;

  set navigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;
    notifyListeners();
  }
}
