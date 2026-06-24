import 'package:flutter/material.dart';
import 'package:vom_app/presentation/screens/articles_by_category_screen.dart';
import 'package:vom_app/presentation/widgets/branding/icons_article_categories.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  // Cambiar esta lista harcordeada cuando se mejore la api para asi recibir las categorias del sistema y ver si esta activas o inactivas
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'MORELOS',
      'id': 18,
    },
    {
      'title': 'NACIONALES',
      'id': 15
    },
    {
      'title': 'INTERNACIONALES',
      'id': 14
    },
    {
      'title': 'DEPORTES',
      'id': 16
    },
  ];
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Numero de Columnas
            crossAxisSpacing: 10, // Espacio Entre Columnas HORIZONTALES
            mainAxisSpacing: 10,  // Espacio Entre Columnas VERTICALES
            childAspectRatio: 0.75, // Si el valor es 1.0, el ancho y el alto son iguales.
                                    // Si es mayor que 1.0, el elemento será más ancho que alto.
                                    // Si es menor que 1.0, el elemento será más alto que ancho.
          ),
          itemCount: categories.length,
          itemBuilder: (context, index){
            return CategoryCard(
              title: categories[index]['title'], 
              id: categories[index]['id']
              );
          }
        ),
      );
  }
}

class CategoryCard extends StatelessWidget {  
  const CategoryCard({super.key, required this.title, required this.id});
  final String title;
  final int id;

  @override
  Widget build(BuildContext context){
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      textStyle: Theme.of(context).textTheme.titleMedium,
      borderRadius: BorderRadius.circular(8.0),
      elevation: 1.0,
      animationDuration: Duration(milliseconds: 200),

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlesByCategoryScreen(id: id, title: title)
            ),
          );
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: IconsArticleCategories(id: id)
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: Theme.of(context).textTheme.titleMedium!.fontSize! - 1),
            )
          ],
        ),
      ),
    );
  }
}