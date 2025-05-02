class button {
  final int id;
  final String name;
  final String price;
  bool isselected;
  button(
      {required this.name,
      required this.price,
      this.isselected = false,
      required this.id});
}

class ProductModel {
  final String image;
  final String location;
  String iconlocation;
  final String Description;
  // final List<button> size = [
  //   button(name: "250gm"),
  //   button(name: "500gm"),
  //   button(name: "1000gm"),
  // ];
  // final List<button> sizecap = [
  //   button(name: "S"),
  //   button(name: "M"),
  //   button(name: "L"),
  // ];
  final String largeimage;
  final String name;
  final String namesmall;
  final String price;
  final String rate;
  final String type;
  final String iconbeantype;
  final String iconlocationtype;

  ProductModel(
      {required this.image,
      required this.name,
      required this.namesmall,
      required this.price,
      required this.rate,
      required this.location,
      this.iconlocation = "assets/Icons/location.svg",
      required this.Description,
      required this.largeimage,
      required this.iconbeantype,
      required this.iconlocationtype,
      required this.type});
}
