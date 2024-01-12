import 'package:exam_flutter/images_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';
//provider, consumer, changeNotifier,stateful, stateless, future dont post (créer provider pour créer user)
//préparer github
// quentin@0fc.tech

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Center(
              child: Text(
                "Panier",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //Si j'ai plus de 0 éléments dans le panier j'afficher la liste des éléments dans le panier
        //Sinon j'affiche le Widget EmptyCart qui affiche "Votre panier est vide'
        child:
        context.watch<Cart>().items.length > 0 ? ListCart() : EmptyCart(),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Votre panier total est de "),
            Text("0.00€ ", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text("Votre panier est vide"),
            Icon(Icons.add_photo_alternate),
          ],
        ),
        Spacer(),
      ],
    );
  }
}

class ListCart extends StatelessWidget {
  const ListCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, _) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Votre panier total est de ",
                  style: TextStyle(fontSize: 16)),
              Text(cart.totalPrice(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: ImageSection(image: cart.items[index].image),
                title: Text(cart.items[index].nom),
                subtitle: Text(
                  cart.items[index].getPrixEuros(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: TextButton(
                  child: const Text('SUPPRIMER'),
                  onPressed: () =>
                      context.read<Cart>().remove(cart.items[index]),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

/*import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Epsi shop")),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Votre panier total est de "),
                Text("0.00€ ", style : TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text("Votre panier est vide"),
                Icon(Icons.add_photo_alternate),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}*/
