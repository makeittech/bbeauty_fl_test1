class Product {
  final String mainTitle;
  final String subtitle;
  final List<SubProduct> listOfSubProduct;
  final String backgroundImage;
  final String titleBackgroundColor;

  Product(this.mainTitle, this.subtitle, this.backgroundImage, this.titleBackgroundColor, this.listOfSubProduct);
}

class SubProduct {
  final String name;

  SubProduct(this.name);
}