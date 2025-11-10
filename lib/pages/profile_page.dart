import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.navIndex=2});
  final  navIndex ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.deepOrange,
        currentIndex: navIndex,
        onTap: (value) {
          if(value ==1){
            Navigator.of(context).pushNamed( 'Cart');
          }
          else if(value ==0){
            Navigator.of(context).pushNamedAndRemoveUntil('Home', (route) => false);
          }
          else if(value ==2){
            Navigator.of(context).pushNamed('Profile');
          }
        },
        items: [
          
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart',),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Profile'),
      ]),
      endDrawer: Drawer(),
      appBar: AppBar(
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
                    title: Text('Emy_Smith@gmail.com', style: TextStyle(fontSize: 18)),
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
