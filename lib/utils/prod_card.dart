import 'package:ecommerce_ui_tut/pages/item_details.dart';
import 'package:flutter/material.dart';

class ProdCard extends StatelessWidget {
  const ProdCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.prodPrice,
  });
  final double prodPrice;
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      radius: 100,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemDetails(imagePath: imagePath, title: title, subTitle: subTitle, price: prodPrice, selectedColor: 'Red',)));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              //image of the product
              child: Image.asset(imagePath),
            ),
            //Title
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            //Subtitle
            Padding(
              padding: EdgeInsets.only(left: 10, top: 0),
              child: Text(
                subTitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
            //Price
            Padding(
              padding: EdgeInsets.only(left: 10, top: 0),
              child: Text(
                '\$${prodPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
