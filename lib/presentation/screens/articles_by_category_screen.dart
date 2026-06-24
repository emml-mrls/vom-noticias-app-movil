import 'package:flutter/material.dart';
import 'package:vom_app/presentation/screens/article_list_screen.dart';
import 'package:vom_app/presentation/widgets/navigation/large_brand_appbar.dart';

class ArticlesByCategoryScreen extends StatelessWidget {
  const ArticlesByCategoryScreen({super.key, required this.id, required this.title});
  final int id;
  final String title;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: LargeBrandAppbar(title: title),
      body: ArticleListScreen(catid: id)
    );
  }
}