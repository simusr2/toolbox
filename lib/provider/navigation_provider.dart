import 'package:flutter/material.dart';
import 'package:toolbox/model/navigation_item.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.home;

  NavigationItem get navigationItem => _navigationItem;

  set navigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;
    notifyListeners();
  }
}
