class Cartmodel {
  final int productid;
  final int productsizeid;
  int qty;
  final String productname;
  final String productSizename;
  final String productImageUrl;
  final String productdescription;
  final String productsmallcaption;
  final String productcategory;
  double price;
  double baseprice;

  Cartmodel(
      {required this.productsizeid,
      required this.qty,
      required this.productname,
      required this.productImageUrl,
      required this.productdescription,
      required this.productSizename,
      required this.productsmallcaption,
      required this.productcategory,
      required this.productid,
      required this.price,
      required this.baseprice});

  factory Cartmodel.fromJson(Map<String, dynamic> json) {
    return Cartmodel(
      productsizeid: json['productsizeId'],
      qty: json['qty'],
      productname: json['productName'],
      productImageUrl: json['productImageUrl'],
      productSizename: json['productSizename'],
      productcategory: json['productCategory'],
      productdescription: json['productDescription'] ?? '',
      productid: json['productid'],
      productsmallcaption: json['productsmallcaption'],
      price: (json['productsizeprice'] as num).toDouble(),
      baseprice: (json['productsizeprice'] as num).toDouble(),
    );
  }
}
