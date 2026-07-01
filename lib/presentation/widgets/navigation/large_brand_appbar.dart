import 'package:flutter/material.dart';
import 'package:vom_app/presentation/widgets/branding/brand_logo.dart';

class LargeBrandAppbar extends StatelessWidget implements PreferredSizeWidget{
const LargeBrandAppbar({super.key, required this.title});
final String title;

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          BrandLogo(height: 110),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(color: Colors.white, width: 3))),
            child: Text(
              title,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(160.0);
}