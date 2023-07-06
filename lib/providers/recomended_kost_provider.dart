import 'dart:async';

import 'package:Koskuappfront/models/models.dart';
import 'package:Koskuappfront/services/kost_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecomendedKostProvider with ChangeNotifier {
  List<KostModel> _kosts = [];
  List<KostModel> get kosts => _kosts;

  set kosts(List<KostModel> kosts) {
    _kosts = kosts;
    notifyListeners();
  }

  Future<void> getRecomendedKost() async {
    try {
      List<KostModel> kosts = await KostService().getRecomendedKost;
      _kosts = kosts;
    } catch (e) {
      print(e);
    }
  }
}
