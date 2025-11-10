import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, this.navIndex});
  final int? navIndex;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Box cartBox = Hive.box('cartBox');
    var items = Hive.box('cartBox').values.toList();
    return Scaffold(
      //botton Navigation bar
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.deepOrange,
        currentIndex: widget.navIndex ?? 1,
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).pushNamed('Cart');
          } else if (value == 0) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('Home', (route) => false);
          } else if (value == 2) {
            Navigator.of(context).pushNamed('Profile');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
          ),
        ],
      ), //End of Bottom Navigation bar

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
      ), // End of AppBar

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var currentItem = items[index] as Map;
            return Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Slidable(

                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        cartBox.deleteAt(index);
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    leading: Image.asset(currentItem['imagePath']),
                    title: Text(currentItem['title'], style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(currentItem['subTitle']),
                    trailing: Text('\$${currentItem['price'].toStringAsFixed(2)}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                  ),
                ),
              ),
            );
          },
        ),

        // start of product card
        // child: Card(
        //   color: Colors.deepOrange[100],
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       // product image
        //       Container(
        //         width: 100,
        //         height: 100,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(15),
        //         ),
        //         child: Image.asset(
        //           widget.imagePath,
        //         ),
        //       ),
        //       // product details
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           // product title
        //           Padding(
        //             padding: const EdgeInsets.only(top: 5, left: 5, right: 0,bottom: 2),
        //             child: Text(
        //               widget.title,
        //               style: TextStyle(
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //           // product subtitle
        //           Padding(
        //             padding: const EdgeInsets.only(top: 0, left: 5, right: 0,bottom: 2),
        //             child: Text(
        //               widget.subTitle,
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.normal,
        //               ),
        //             ),
        //           ),
        //           // product price
        //           Padding(
        //         padding: EdgeInsets.only(left: 5, top: 0),
        //         child: Text(
        //           '\$${widget.price.toStringAsFixed(2)}',
        //           style: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.deepOrange,
        //           ),
        //         ),
        //       ),
        //         ],
        //       ), // End of product details column

        //     ],
        //   ),
        // ),
      ),
    );
  }
}
