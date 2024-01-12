import 'package:exam_flutter/bo/article.dart';
import 'package:flutter/cupertino.dart';

import 'article.dart';

class Cart extends ChangeNotifier{
  final _items = <Article>[];

  List<Article> get items => _items;

  void add(Article article){
    _items.add(article);
    notifyListeners();
  }

  void remove(Article article){
    _items.remove(article);
    notifyListeners();
  }

  void removeAll(Article article){
    _items.remove(article);
    notifyListeners();
  }

  String totalPrice() {
    num total = 0;
    for (Article article in _items) {
      total += article.prix;
    }
    return "${total.toStringAsFixed(2)}€";
  }
  String economy() {
    num economy = 0;
    for (Article article in _items) {
      economy += article.prix*0.2;
    }
    return "${economy.toStringAsFixed(2)}€";
  }
  String priceTTH() {
    num prixTTC = 0;
    for (Article article in _items) {
      prixTTC += article.prix*(1+0.2);
    }
    return "${prixTTC.toStringAsFixed(2)}€";
  }
}