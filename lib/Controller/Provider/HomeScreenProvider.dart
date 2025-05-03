import 'package:coffeeshopapp/Controller/GetProduct.dart';
import 'package:coffeeshopapp/Model/Product.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:coffeeshopapp/Pages/Home/productdetails.dart';
import 'package:coffeeshopapp/Controller/Provider/Productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Homescreenprovider extends ChangeNotifier {
  List<bool> _select = [];
  List<String> _Cat = [];
  List<Product> _filteredprocudcts = [];
  List<Product> _coffeeproducts = [];
  List<Product> _beansproducts = [];
  List<Product> _allproducts = [];
  int ct = 0;

  List<bool> get select => _select;
  List<String> get Cat => _Cat;
  List<Product> get filteredprocudcts => _filteredprocudcts;
  List<Product> get coffeeproducts => _coffeeproducts;
  List<Product> get beansproducts => _beansproducts;

  Future<void> pushbutton(BuildContext context, Product item) async {
    final product = Provider.of<Productdetailsprovider>(context, listen: false);

    await product.getfav(item.id);
    notifyListeners();
  }

  void initializeCounter() {
    loadProducts();
    notifyListeners();
  }

  Future<void> loadProducts() async {
    _allproducts = await getallproduct();
    await makecat();
  }

  void selectcategory(int index) {
    _filteredprocudcts.clear();
    print(_allproducts.length);

    if (index == 0) {
      for (int i = 0; i < _allproducts.length; i++) {
        _filteredprocudcts.add(_allproducts[i]);
      }
    } else {
      for (int i = 0; i < _allproducts.length; i++) {
        print("add");

        if (_allproducts[i].category == Cat[index]) {
          _filteredprocudcts.add(_allproducts[i]);
        }
      }
    }

    _select = List.generate(Cat.length, (x) => x == false);
    select[index] = true;
    notifyListeners();
  }

  Future<void> makecat() async {
    _Cat.clear();
    _Cat.add("All");

    for (int i = 0; i < _allproducts.length; i++) {
      _filteredprocudcts.add(_allproducts[i]);

      for (int j = 0; j < _Cat.length; j++) {
        if (_Cat[j] == _allproducts[i].category) {
          ct++;
          break;
        }
      }
      if (ct == 0) {
        Cat.add(_allproducts[i].category);
      }
      ct = 0;
    }
    print(Cat.length);
    _select = List.generate(Cat.length, (x) => x == false);
    _coffeeproducts = await getcoffeeproduct();
    _beansproducts = await getbeanproduct();
    _select[0] = true;
    notifyListeners();
  }
}
