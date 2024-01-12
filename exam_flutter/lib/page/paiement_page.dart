import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class PaiementPage extends StatelessWidget {
  PaiementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Finalisation de la commande",
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Récapitulatif de votre commande",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 35.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sous-Total"),
                            Text(cart.totalPrice()),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vous économisez",
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              "1€",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TVA",
                            ),
                            Text(cart.economy(),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("TOTAL"),
                            Text(cart.priceTTH()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                const Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Adresse de livraison",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nom prenom",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "adresse",
                            ),
                            Text(
                              ">",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Text(
                          "suite adresse",
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                const Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Méthode de paiement",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                          icon: const Card(
                            color: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.ccApplePay,
                              color: Colors.black,
                              size: 55,
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                          icon: const Card(
                            color: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.ccVisa,
                              color: Colors.black,
                              size: 55,
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                          icon: const Card(
                            color: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.ccMastercard,
                              color: Colors.black,
                              size: 55,
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: IconButton(
                          icon: const Card(
                            color: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.ccPaypal,
                              color: Colors.black,
                              size: 55,
                            ),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Text(
                  "En cliquant sur Confirmer l’achat , vous acceptez les Conditions de vente de EPSI Shop International. Besoin d’aide ? Désolé on peut rien faire.\nEn poursuivant, vous acceptez les Conditions d’utilisation du fournisseur de paiement CoffeDis.",
                  style: TextStyle(fontSize: 10),),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, //
                    ),
                    child: const Text(
                      "Confirmer l'achat",
                      style:
                      TextStyle(color: Colors.white70,),
                    ),
                    onPressed: () => context.go('/paiement-page'),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
