import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:ecommerce_ui_tut/utils/categories_tile.dart';
import 'package:ecommerce_ui_tut/utils/prod_card.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key, this.navIndex = 0});
  final int navIndex;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        iconDurationMillSec: 200,
        activeIndex: widget.navIndex!,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).pushNamed('Cart');
          } else if (index == 0) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('Home', (route) => false);
          } else if (index == 2) {
            Navigator.of(context).pushNamed('Profile');
          }
        },
        activeIcons: [
          Icon(Icons.home_outlined, color: Colors.white, size: 40),
          Icon(Icons.shopping_bag_outlined, color: Colors.deepOrange, size: 40),
          Icon(Icons.person_2_rounded, color: Colors.deepOrange, size: 40),
        ],
        inactiveIcons: [
          Icon(Icons.home_outlined, color: Colors.white, size: 30),
          Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 30),
          Icon(Icons.person_2_rounded, color: Colors.white, size: 30),
        ],
        color: Colors.grey[400]!,
        cornerRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        circleWidth: 75,
        elevation:5,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        shadowColor: Colors.deepOrange,
        circleShadowColor: Colors.orangeAccent,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ Colors.deepOrange, Colors.orangeAccent ],
        ),
        circleGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ Colors.deepOrange, Colors.orangeAccent ],
        ),
      ),
      
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
                  child: IconButton(
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
                  ), //Reuse Tile in utils folder
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
              // Best Selleing Section
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              children: [
                ProdCard(
                  imagePath: 'images/charlesdeluvio-1-nx1QR5dTE-unsplash.jpg',
                  title: 'Sunglass',
                  subTitle: 'Porsche design',
                  prodPrice: 500.99,
                ),
                ProdCard(
                  imagePath: 'images/giorgio-trovato-K62u25Jk6vo-unsplash.jpg',
                  title: 'Black Sunglass',
                  subTitle: 'Elegent RayBan',
                  prodPrice: 1364.99,
                ),
                ProdCard(
                  imagePath: 'images/giorgio-trovato-0CZwuZhiC84-unsplash.jpg',
                  title: 'Cool Car toy',
                  subTitle: 'Good Car Scale 1:18',
                  prodPrice: 300.585,
                ),
                ProdCard(
                  imagePath: 'images/giorgio-trovato-p0OlRAAYXLY-unsplash.jpg',
                  title: 'Fiat 500x toy',
                  subTitle: 'Fiat 500X Scale 1:18',
                  prodPrice: 600.24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
