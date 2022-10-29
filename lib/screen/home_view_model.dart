import 'package:flutter/material.dart';
import 'package:runner_app/data/model/api_item_model.dart';
import 'package:runner_app/data/repository/repository.dart';

class HomeScreenViewModel extends ChangeNotifier {

  List<ApiItemModel> _listItemModel = [];
  List<ApiItemModel> get listItemModel => _listItemModel;

  Repository repository = ApiRepository();

  getUsers() async {
    var response = await repository.getItems();

    setItems(response);
  }

  setItems(List<ApiItemModel> items) {
    _listItemModel = items;
    notifyListeners();
  }

}