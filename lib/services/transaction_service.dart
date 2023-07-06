import 'dart:convert';
import 'package:Koskuappfront/models/models.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'http://www.koskuapp.web.id/api';

  Future<List<Transaction>> getTransaction(String token) async {
    var url = '$baseUrl/transaction';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List list = data['data']['data'] as List;
      List<Transaction> transactions = [];

      for (int i = 0; i < list.length; i++) {
        transactions.add(Transaction.fromJson(list[i]));
      }

      return transactions;
    } else {
      throw Exception('Gagal Ambil Data');
    }
  }

  Future<Transaction> submitTransaction(
      KostModel kost, User user, int total) async {
    var url = '$baseUrl/submit';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '${user.token}',
    };

    var response = await http.post(Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          'kontrakan_id': kost.id,
          'users_id': user.id,
          'total': total,
          'room': kost.room,
          'status': 'PENDING'
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      Transaction transactions = Transaction.fromJson(data['data']);
      return transactions;
    } else {
      throw Exception('Gagal Ambil Data');
    }
  }
}
