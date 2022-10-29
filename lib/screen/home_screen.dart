import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_app/data/model/api_item_model.dart';
import 'package:runner_app/screen/home_view_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel homeScreenViewModel =
        context.watch<HomeScreenViewModel>();
    homeScreenViewModel.getUsers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider Example App'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        ApiItemModel itemModel =
                            homeScreenViewModel.listItemModel[index];
                        return Text(
                          "${itemModel.name} - ${itemModel.password}",
                          style: const TextStyle(color: Colors.black),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: homeScreenViewModel.listItemModel.length))
            ],
          ),
        ));
  }
}
