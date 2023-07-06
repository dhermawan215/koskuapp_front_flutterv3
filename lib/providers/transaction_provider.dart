import 'dart:async';

import 'package:Koskuappfront/models/models.dart';
import 'package:Koskuappfront/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  Transaction? _transaction;
  Transaction? get transaction => _transaction;

  set transactions(List<Transaction> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  set transaction(Transaction? transaction) {
    _transaction = transaction;
    notifyListeners();
  }

  void getTransaction(String token) {
    try {
      TransactionService().getTransaction(token).then((value) {
        _transactions = value;
      });
      //List<Transaction> transactions = await TransactionService().getTransaction(token);

      //_transactions = transactions;
    }
    catch (e)
    {

    }
  }

  Future<String?> submitTransaction(KostModel kost, User user, int total) async {
    Transaction? transaction = await TransactionService().submitTransaction(kost, user, total);

    if (transactions != null) {
      _transactions = transactions;
      return transaction.paymentUrl;
    } else {
      return null;
    }
  }
}
