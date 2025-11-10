import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.navIndex = 2});
  final navIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        iconDurationMillSec: 200,
        activeIndex: navIndex!,
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
          Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 40),
          Icon(Icons.person_2_rounded, color: Colors.white, size: 40),
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
        elevation: 5,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        shadowColor: Colors.deepOrange,
        circleShadowColor: Colors.orangeAccent,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.deepOrange, Colors.orangeAccent],
        ),
        circleGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.deepOrange, Colors.orangeAccent],
        ),
      ),
      endDrawer: Drawer(),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.grey[300],
        title: Text('Profile'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'images/christopher-campbell-rDEOVtE7vOs-unsplash.jpg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  child: ListTile(
                    leading: Text(
                      'Full Name:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    title: Text('Emy Smith', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(height: 15),
                Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  child: ListTile(
                    leading: Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    title: Text(
                      'Emy_Smith@gmail.com',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  child: ListTile(
                    leading: Text(
                      'Phone:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    title: Text('01061802166', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
