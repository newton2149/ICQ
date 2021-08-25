import 'package:cvg/screen/homepage_screen.dart';
import 'package:flutter/material.dart';
import './Providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          canvasColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
      ),
    );
  }
}
