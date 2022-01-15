import 'package:flutter/material.dart';

class providerclass extends ChangeNotifier{
  late bool state;

providerclass({required this.state});

void setState(bool value) {
 state=value;
  notifyListeners();
}

}