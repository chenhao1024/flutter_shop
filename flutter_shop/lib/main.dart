import 'package:flutter/material.dart';
import './pages/index_page.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialApp(
        title: '百姓生活+ddd',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ) ,);
  }
}