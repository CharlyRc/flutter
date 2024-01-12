import 'dart:convert';

import 'package:exam_flutter/images_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final listArticles = [
    Article(
        nom: "PC portable",
        description: "Pc portable google",
        categorie: "categorie",
        prix: 350,
        image:
        "https://media.istockphoto.com/id/1399199234/fr/photo/auvent-et-terrasse-de-maison-de-luxe-illustration-3d.jpg?s=1024x1024&w=is&k=20&c=p2jZ_yS-YDFyj92hqwwePUIugzi5HUEfFHIGfEq9mLA="),
    Article(
        nom: "Voiture",
        description: "tesla du futur",
        categorie: "categorie",
        prix: 35000,
        image:
        "https://media.istockphoto.com/id/1562275898/fr/photo/rendu-3d-dun-concept-car-g%C3%A9n%C3%A9rique-sans-marque.jpg?s=612x612&w=0&k=20&c=cBu2IprlP7bVIJEE-V8pwP1btUdXCcTLvfzKvlNgS2g="),
    Article(
        nom: "Moto",
        description: "600 Daytona",
        categorie: "categorie",
        prix: 16000,
        image:
        "https://media.istockphoto.com/id/1399199234/fr/photo/auvent-et-terrasse-de-maison-de-luxe-illustration-3d.jpg?s=1024x1024&w=is&k=20&c=p2jZ_yS-YDFyj92hqwwePUIugzi5HUEfFHIGfEq9mLA="),
    Article(
        nom: "Parasol",
        description: "parasol bleu",
        categorie: "categorie",
        prix: 28,
        image:
        "https://media.istockphoto.com/id/1399199234/fr/photo/auvent-et-terrasse-de-maison-de-luxe-illustration-3d.jpg?s=1024x1024&w=is&k=20&c=p2jZ_yS-YDFyj92hqwwePUIugzi5HUEfFHIGfEq9mLA="),
    Article(
        nom: "Maison",
        description: "Villa avec piscine",
        categorie: "categorie",
        prix: 3500000,
        image:
        "https://media.istockphoto.com/id/1399199234/fr/photo/auvent-et-terrasse-de-maison-de-luxe-illustration-3d.jpg?s=1024x1024&w=is&k=20&c=p2jZ_yS-YDFyj92hqwwePUIugzi5HUEfFHIGfEq9mLA="),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Center(
                child: Text(
                  "Liste des articles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                )),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Badge(
              offset: Offset(-10, 8),
              label: Text(
                "${context.watch<Cart>().items.length}",
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () => context.go('/cart'),
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
            IconButton(onPressed: ()=> context.go("/about-us"), icon: Icon(Icons.info_outline),)
          ],
        ),
        body: FutureBuilder<List<Article>>(
            future: fetchListArticles(),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () =>
                    context.go("/detail", extra: snapshot.data![index]),
                leading:
                ImageSection(image: snapshot.data![index].image),
                title: Text(snapshot.data![index].nom),
                subtitle: Text(
                  snapshot.data![index].getPrixEuros(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: TextButton(
                  child: const Text('AJOUTER'),
                  onPressed: () =>
                      context.read<Cart>().add(snapshot.data![index]),
                ),
              ),
            )
                : const Icon(Icons.error)));
  }

  Future<List<Article>> fetchListArticles() async {
    final response = await get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final listMapArticles = jsonDecode(response.body) as List<dynamic>;
      final listArticles = <Article>[];
      for (Map<String, dynamic> map in listMapArticles) {
        listArticles.add(Article.fromMap(map));
      }
      return listArticles;
    } else {
      throw Exception("Erreur lors de la réception des articles");
    }
  }
}
