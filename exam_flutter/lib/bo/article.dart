class Article{
  String nom;
  String description;
  String categorie;
  num prix;
  String image;

  //Constructeur avec paramètres nommés et requis
  Article({
    required this.nom,
    required this.description,
    required this.categorie,
    required this.prix,
    required this.image,
  });
  //Méthode retournant le prix
  String getPrixEuros() => "$prix€";

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'description': this.description,
      'categorie': this.categorie,
      'prix': this.prix,
      'image': this.image,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      nom: map['title'] as String,
      description: map['description'] as String,
      categorie: map['category'] as String,
      prix: map['price'] as num,
      image: map['image'] as String,
    );
  }
}

void main(){
  final listArticles = [
    Article(nom: "nom lovre",
        description: "description",
        categorie: "categorie",
        prix: 35,
        image: "image")
  ];
  print("le produit ${listArticles[0].nom} est vendu à un tarif de ${listArticles[0].getPrixEuros()}");
}