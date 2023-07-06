import 'dart:convert';
import 'package:Koskuappfront/models/models.dart';
import 'package:http/http.dart' as http;

class KostService {
  // String baseUrl = 'http://103.183.74.160/api';
  String baseUrl = 'http://www.koskuapp.web.id/api';

  Future<List<KostModel>> getKosts() async {
    var url = '$baseUrl/kontrakans';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    // var data = jsonDecode(response.body)['data']['data'];
    // print(data);

    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body)['data']['data'];

      List<KostModel> kosts = [];

      for (var item in datas) {
        kosts.add(KostModel.fromJson(item));
      }

      return kosts;
    } else {
      throw Exception('Gagal Ambil Data');
    }

    // if (response.statusCode != 200) {
    //   throw Exception('Gagal Ambil Data');
    // }
    // print(data['data']['data']);
    // List<Kosts> kosts =
    //     (data['data']['data']).map((e) => Kosts.fromJson(e)).toList();

    // return kosts;
  }

  //rekomendasi kost

  Future<List<KostModel>> get getRecomendedKost async {
    var url = '$baseUrl/recomendedkost';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    // var data = jsonDecode(response.body)['data']['data'];
    // print(data);

    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body)['data']['data'];

      List<KostModel> kosts = [];

      for (var item in datas) {
        kosts.add(KostModel.fromJson(item));
      }

      return kosts;
    } else {
      throw Exception('Gagal Ambil Data');
    }

    // if (response.statusCode != 200) {
    //   throw Exception('Gagal Ambil Data');
    // }
    // print(data['data']['data']);
    // List<Kosts> kosts =
    //     (data['data']['data']).map((e) => Kosts.fromJson(e)).toList();

    // return kosts;
  }

  //populer kost

  Future<List<KostModel>> get getPopularKost async {
    var url = '$baseUrl/popularkost';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    // var data = jsonDecode(response.body)['data']['data'];
    // print(data);

    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body)['data']['data'];

      List<KostModel> kosts = [];

      for (var item in datas) {
        kosts.add(KostModel.fromJson(item));
      }

      return kosts;
    } else {
      throw Exception('Gagal Ambil Data');
    }

    // if (response.statusCode != 200) {
    //   throw Exception('Gagal Ambil Data');
    // }
    // print(data['data']['data']);
    // List<Kosts> kosts =
    //     (data['data']['data']).map((e) => Kosts.fromJson(e)).toList();

    // return kosts;
  }

  //kost baru
  Future<List<KostModel>> get getNewKost async {
    var url = '$baseUrl/newkost';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    // var data = jsonDecode(response.body)['data']['data'];
    // print(data);

    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body)['data']['data'];

      List<KostModel> kosts = [];

      for (var item in datas) {
        kosts.add(KostModel.fromJson(item));
      }

      return kosts;
    } else {
      throw Exception('Gagal Ambil Data');
    }

    // if (response.statusCode != 200) {
    //   throw Exception('Gagal Ambil Data');
    // }
    // print(data['data']['data']);
    // List<Kosts> kosts =
    //     (data['data']['data']).map((e) => Kosts.fromJson(e)).toList();

    // return kosts;
  }

  //kost umum
  Future<List<KostModel>> get getGeneralKost async {
    var url = '$baseUrl/generalkost';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    // var data = jsonDecode(response.body)['data']['data'];
    // print(data);

    if (response.statusCode == 200) {
      List datas = jsonDecode(response.body)['data']['data'];

      List<KostModel> kosts = [];

      for (var item in datas) {
        kosts.add(KostModel.fromJson(item));
      }

      return kosts;
    } else {
      throw Exception('Gagal Ambil Data');
    }

    // if (response.statusCode != 200) {
    //   throw Exception('Gagal Ambil Data');
    // }
    // print(data['data']['data']);
    // List<Kosts> kosts =
    //     (data['data']['data']).map((e) => Kosts.fromJson(e)).toList();

    // return kosts;
  }
}
