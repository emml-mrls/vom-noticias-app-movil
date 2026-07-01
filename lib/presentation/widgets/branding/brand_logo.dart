import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vom_app/presentation/view_models/settings_view_model.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context){
    final bool isDarkMode= context.watch<SettingsViewModel>().settings!.isDarkMode;
    return Image.asset(
      isDarkMode
        ? 'assets/app_icon_complete_b.png'
        : 'assets/app_icon_complete_r.png'
      ,
      height: height,
      fit: BoxFit.contain,
    );
  }
}