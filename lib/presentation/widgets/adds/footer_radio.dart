import 'package:flutter/material.dart';

class FooterRadio extends StatelessWidget {
const FooterRadio({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.4),
          topRight: Radius.circular(24.4),
        ),
      ),
      child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
        child: Center(
          child: Image.asset('assets/radio.png',
            height: 200, fit: BoxFit.contain),
          ),
      ),
    );
  }
}