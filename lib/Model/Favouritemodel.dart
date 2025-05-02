class Favouritemodel {
  final int productId;
  final String productName;
  final String productImageUrl;
  final String productDescription;
  final double productRate;
  final String productCategory;

  Favouritemodel({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.productDescription,
    required this.productRate,
    required this.productCategory,
  });

  factory Favouritemodel.fromJson(Map<String, dynamic> json) {
    return Favouritemodel(
      productId: json['productId'],
      productName: json['productName'],
      productImageUrl: json['productImageUrl'],
      productDescription: json['productDescription'],
      productRate: (json['productRate'] as num).toDouble(),
      productCategory: json['productCategory'],
    );
  }
}
