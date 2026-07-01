import 'package:flutter/material.dart';

class BrandMark extends StatelessWidget {
const BrandMark({super.key, this.height});
final double? height;

  @override
  Widget build(BuildContext context){
    return Image.asset(
      'assets/palomita_blanca.png',
      height: height,
      fit: BoxFit.contain,
    );
  }
}