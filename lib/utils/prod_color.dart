import 'package:flutter/material.dart';

class ProdColor extends StatelessWidget {
  const ProdColor({super.key,required this.color, required this.colorName});
  final Color color;
  final String colorName;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(width: 5),
        Text(colorName, style: TextStyle(fontSize: 16)),
        SizedBox(width: 15),
      ],
    );
  }
}
