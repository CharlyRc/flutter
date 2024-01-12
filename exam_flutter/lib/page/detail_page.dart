import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';
import '../images_section.dart';

class DetailPage extends StatelessWidget {
  final Article article;
  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.nom)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            article.image,
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(article.nom),
          const SizedBox(
            height: 16.0,
          ),
          Text(article.description),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            article.getPrixEuros(),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            article.categorie,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () => context.read<Cart>().add(article),
              child: Text("AJOUTER AU PANIER")),
        ],
      ),
    );
  }
}
