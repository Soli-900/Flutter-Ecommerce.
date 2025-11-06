import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.price,
  });
  final String imagePath;
  final String title;
  final String subTitle;
  final double price;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(Icons.shopify_outlined, color: Colors.deepOrange, size: 30),
            Text('Soli'),
            Text('Shop'),
          ],
        ),
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Center(
            child: Card(
              elevation: 5,

              child: Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(widget.imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(widget.title),
          SizedBox(height: 20),
          Text(widget.subTitle),
          SizedBox(height: 20),
          Text('\$${widget.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
