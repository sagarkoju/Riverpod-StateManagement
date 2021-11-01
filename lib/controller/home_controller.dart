import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpodapp/model/home.dart';

final getDataScreen = ChangeNotifierProvider<DataScreen>((ref) => DataScreen());

class DataScreen extends ChangeNotifier {
  List<DataModel> listData = [];
  DataScreen() {
    getData();
  }
  getData() async {
    listData = [];
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      listData.add(DataModel.fromMap(data[i]));
    }
    notifyListeners();
  }
}
