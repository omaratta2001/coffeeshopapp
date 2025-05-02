import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/GetFavourites.dart';
import 'package:coffeeshopapp/Model/Favouritemodel.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:flutter/material.dart';

class Productdetailsprovider extends ChangeNotifier {
  List<Favouritemodel> fav = [];
  bool isfav = false;

  List<Favouritemodel> get _fav => fav;
  bool get _isfav => isfav;
  String price = "";
  int? id;
  String get _price => price;
  int? get _id => id;
  Future<void> getfav(int productid) async {
    isfav = false;
    fav = await getfavourites();
    for (int i = 0; i < fav.length; i++) {
      if (fav[i].productId == productid) {
        isfav = true;
        print("hello" + isfav.toString());
      }
    }
    notifyListeners();
  }

  void initializeCounter(int productid) {
    getfav(productid);
    notifyListeners();
  }

  void selectbutton(List<button> size, button item) {
    size.forEach((e) => e.isselected = false);
    item.isselected = true;
    price = item.price.toString();
    id = item.id;
    notifyListeners();
  }

  void checkfav(int productid, BuildContext context) {
    if (isfav) {
      removeFromFavourites(productid);

      isfav = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed from Favourite'),
          duration: Duration(seconds: 2),
          backgroundColor: red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: 100,
            left: 20,
            right: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      addfavourite(productid);
      isfav = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✔ Added to Favourite'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: 100,
            left: 20,
            right: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    print(isfav);

    notifyListeners();
  }
}
