class ProductSize {
  final int id;
  final int productId;
  final String sizeName;
  final double price;
  final int qty;
  final int available;

  ProductSize({
    required this.id,
    required this.productId,
    required this.sizeName,
    required this.price,
    required this.qty,
    required this.available,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'],
      productId: json['productId'],
      sizeName: json['sizeName'],
      price: (json['price'] as num).toDouble(),
      qty: json['qty'],
      available: json['available'],
    );
  }
}
