

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:runner_app/data/model/api_item_model.dart';

class ApiRepository extends Repository {

  final Client client = Client();
  static const itemsUrl = 'https://635d9820ea764497f0dfa19c.mockapi.io/api/v1/items';

  @override
  Future<List<ApiItemModel>> getItems() async {
    final response = await client.get(Uri.parse(itemsUrl));

    return compute(parseItems, response.body);
  }

  static List<ApiItemModel> parseItems(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<ApiItemModel>((json) => ApiItemModel.fromJson(json)).toList();
  }

  // return [
  // const ApiItemModel("0", "Obit", "314f43fw4f"),
  // const ApiItemModel("1", "Public", "frsfsrfsr"),
  // const ApiItemModel("2", "Zsxdc", "F0V0a99z"),
  // ];

}

abstract class Repository {

  Future<List<ApiItemModel>> getItems();

}