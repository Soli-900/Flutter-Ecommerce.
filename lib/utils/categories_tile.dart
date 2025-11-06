import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    super.key,
    required this.catgIcon,
    required this.catgText,
  });
  final IconData catgIcon;
  final String catgText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[400],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(catgIcon, size: 40, color: Colors.white),
          ),
        ),
        Text(
          catgText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
