import 'package:flutter/material.dart';
import 'package:flutter_sample/model/articles.dart';

class PArguments {
  final Articles articles;

  PArguments(this.articles);
}

class ProductDetails extends StatelessWidget {
//  final Articles articles;
  PArguments args;
//  ProductDetails({this.articles});
//  {
//    this.articles = articles;
//  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
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
          Image.network(args.articles.urlToImage),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text(args.articles.description,
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
