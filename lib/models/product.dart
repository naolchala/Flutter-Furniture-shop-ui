class Product {
  late int id;
  late String title;
  late int price;
  late String url;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.url});
}

List<Product> products = [
  Product(
      id: 1, title: "Classic Leather Armchair", price: 56, url: "chair-1.png"),
  Product(id: 2, title: "Modern Armchair sofa", price: 78, url: "chair-2.png"),
  Product(
      id: 3, title: "Brown Comfortable Sofa", price: 199, url: "chair-3.png"),
];
