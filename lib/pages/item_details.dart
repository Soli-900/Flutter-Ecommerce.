import 'package:ecommerce_ui_tut/utils/prod_color.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.selectedColor,
  });
  final String imagePath;
  final String title;
  final String subTitle;
  final double price;
  final String? selectedColor;

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
      body: ListView(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.subTitle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10),
              Text(
                '\$${widget.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              Row(
                //colors row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Color:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  ProdColor(color: Colors.red, colorName: 'Red'),
                  ProdColor(color: Colors.black, colorName: 'Black'),
                  ProdColor(color: Colors.blue, colorName: "Blue"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Size:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text('M', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 15),
                  Text('L', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 15),
                  Text('XL', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
