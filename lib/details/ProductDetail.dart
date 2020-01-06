import 'package:flutter/material.dart';
import 'package:flutter_sample/model/articles.dart';

class ProductDetails extends StatelessWidget {
  Articles articles;

  ProductDetails(Articles articles) {
    this.articles = articles;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: Navigator.of(context).pop,
          ),
          title: Text("Details"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Image.network(articles.urlToImage),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(articles.description,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
