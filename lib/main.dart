import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_app/screen/home_screen.dart';
import 'package:runner_app/screen/home_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        title: 'Runner App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
      ),
    );
  }
}
