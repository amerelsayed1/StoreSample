import 'package:flutter/material.dart';

import '../details/ProductDetail.dart';
import '../home/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
//    initialRoute: '/',
    initialRoute: '/homeScreen',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
//      '/': (context) => HomeScreen()
      '/homeScreen': (context) => HomeScreen(),
      '/detailsScreen': (context) => ProductDetails()
    },
  ));
}
