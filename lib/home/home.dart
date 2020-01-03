import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/News.dart';
import 'Products.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _products = [];

  Future<News> news;

  Future<News> fetchPost() async {
    final response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=cb661b8b1c7a41ef8334b01ff6d7c2f4');

    if (response.statusCode == 200) {
      print("test Sucess");

      // If server returns an OK response, parse the JSON.
      return News.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();

    news = fetchPost();

    _products.add('Laptop');
    _products.add('Laptop');
    _products.add('Laptop');
    _products.add('Laptop');
    _products.add('Laptop');
    _products.add('Laptop');
  }

  /**/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
            appBar: AppBar(
                title: Text('Long List App')),
            body: Center(
              child: FutureBuilder<News>(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      Expanded(child: Product(snapshot.data.articles))
                    ]);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            )));
  }
}
