import 'package:coffeeshopapp/Controller/Cart/CartController.dart';
import 'package:coffeeshopapp/Model/Cartmodel.dart';
import 'package:coffeeshopapp/Widget/Cart/Largebutton.dart';
import 'package:coffeeshopapp/Widget/Cart/Smallbutton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Cartscreenprovider extends ChangeNotifier {
  List<Cartmodel> productcart = [];
  List<int> indices = [];
  Map<int, List<Cartmodel>> grouped = {};

  List<Widget> widgets = [];
  double tot = 0;
  List<Cartmodel> get _productcart => productcart;
  List<Widget> get _widgets => widgets;
  double get _tot => tot;
  Map<int, List<Cartmodel>> get _grouped => grouped;
  List<int> get _indices => indices;

  double _scale = 1.0;
  double get scale => _scale;

  void tapDown() {
    _scale = 0.95;
    notifyListeners();
  }

  void tapUp() {
    _scale = 1.0;
    notifyListeners();
  }

  void tapCancel() {
    _scale = 1.0;
    notifyListeners();
  }

  Future<void> initializeCounter() async {
    await loadcartscreen();
    gettot();
    notifyListeners();
  }

  Future<void> loadcartscreen() async {
    widgets.clear();
    grouped.clear();
    productcart = await getcart();

    for (var item in productcart) {
      grouped.putIfAbsent(item.productid, () => []);
      grouped[item.productid]!.add(item);
    }

    // ابني الليست النهائية من Large و Small buttons
    grouped.forEach((productid, items) async {
      if (items.length == 1) {
        items.first.price = items.first.price * items.first.qty;

        widgets.add(Smallbutton1(
          widgetindex: widgets.length,
          productid: productid,
        ));
      } else {
        for (var item in items) {
          item.price = item.price * item.qty;
        }
        indices = items.map((e) => productcart.indexOf(e)).toList();
        widgets.add(LargeButton1(
          widgetindex: widgets.length, productid: productid,
          // pass list of indices
        ));
      }
    });
    print(grouped);
    widgets.add(Gap(70));
    gettot();

    notifyListeners();
  }

  Future<void> removewidget(int index) async {
    await widgets.removeAt(index);
    notifyListeners();
  }

  void gettot() {
    tot = 0;
    for (var item in productcart) {
      tot = tot + (item.price * item.qty);
    }
  }

  Future<void> increasetot(index) async {
    tot += productcart[index].baseprice;
    productcart[index].price += productcart[index].baseprice;
    productcart[index].qty++;
    await updatecart(productcart[index].productsizeid, productcart[index].qty);
    notifyListeners();
  }

  Future<void> increaselarge(
      int groupindex, int productid, int widgetindex) async {
    final item = grouped[productid]![groupindex];
    tot += item.baseprice;
    item.price += item.baseprice;
    item.qty++;
    await updatecart(item.productsizeid, item.qty);
    notifyListeners();
  }

  Future<void> dectot(int productid, int groupindex, int widgetindex) async {
    final item = grouped[productid]![groupindex];

    tot -= item.baseprice;
    if (item.qty != 1) {
      item.price -= item.baseprice;
      item.qty--;
      await updatecart(item.productsizeid, item.qty);
    } else if (item.qty == 1) {
      await grouped[productid]!.removeAt(groupindex);

      await removecart(item.productsizeid, item.qty);
      removewidget(widgetindex);
    }
    notifyListeners();
  }

  Future<void> dectotlarge(
      int groupindex, int productid, int widgetindex) async {
    final item = grouped[productid]![groupindex];
    tot -= item.baseprice;
    if (item.qty != 1) {
      item.price -= item.baseprice;
      item.qty--;
      await updatecart(item.productsizeid, item.qty);
    } else if (item.qty == 1) {
      grouped[productid]!.removeAt(groupindex);
      await removecart(item.productsizeid, item.qty);
      if (grouped[productid]!.length == 1) {
        removewidget(widgetindex);
        widgets.insert(
            widgetindex,
            Smallbutton1(
              widgetindex: widgetindex,
              productid: productid,
            ));
      }
    }
    notifyListeners();
  }
}
