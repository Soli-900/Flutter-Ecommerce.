import 'package:ecommerce_ui_tut/utils/categories_tile.dart';
import 'package:ecommerce_ui_tut/utils/prod_card.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.deepOrange,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Profile'),
      ]),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 18),
                      prefixIcon: Icon(Icons.search, size: 30),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: 
                   IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(Icons.menu, size: 40),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            SizedBox(
              //Start of Categories Section
              height: 110, //section height
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoriesTile(
                    catgIcon: Icons.man,
                    catgText: 'Men',
                  ), //Reuse Tile in urtils folder
                  SizedBox(width: 20),
                  CategoriesTile(catgIcon: Icons.woman, catgText: 'Woman'),
                  SizedBox(width: 20),
                  CategoriesTile(catgIcon: Icons.child_care, catgText: 'Kids'),
                  SizedBox(width: 20),
                  CategoriesTile(
                    catgIcon: Icons.directions_car,
                    catgText: 'Cars',
                  ),
                  SizedBox(width: 20),
                  CategoriesTile(
                    catgIcon: Icons.pedal_bike_outlined,
                    catgText: 'Bikes',
                  ),
                ],
              ),
            ), //End of Categories Section

            SizedBox(height: 10),
            Text(
              'Best Selling',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              children: [
               ProdCard(imagePath: 'images/charlesdeluvio-1-nx1QR5dTE-unsplash.jpg', title: 'Sunglass', subTitle: 'Porsche design', prodPrice: 500.99),
               ProdCard(imagePath: 'images/giorgio-trovato-K62u25Jk6vo-unsplash.jpg', title: 'Black Sunglass', subTitle: 'Elegent RayBan', prodPrice: 1364.99),
               ProdCard(imagePath: 'images/giorgio-trovato-0CZwuZhiC84-unsplash.jpg', title: 'Cool Car toy', subTitle: 'Good Car Scale 1:18', prodPrice: 300.585),
               ProdCard(imagePath: 'images/giorgio-trovato-p0OlRAAYXLY-unsplash.jpg', title: 'Fiat 500x toy', subTitle: 'Fiat 500X Scale 1:18', prodPrice: 600.24)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
