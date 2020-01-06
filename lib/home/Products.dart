import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/articles.dart';
import '../details/ProductDetail.dart';

class Product extends StatelessWidget {
  final List<Articles> data;

  Product(this.data);

  /*function return Row item Widget*/
  Widget _buildProductItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print("Test " + index.toString());
        /*For navigation Between Screens */
        //Navigator.pushNamed(context, '/detailsScreen');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ProductDetails(data[index])));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
                placeholder: 'assets/food.jpg', image: data[index].urlToImage),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(data[index].title, textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: data.length,
    );
  }
}
