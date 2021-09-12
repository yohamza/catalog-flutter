import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  CartModel._privateConstructor();

  static final CartModel _instance = CartModel._privateConstructor();

  factory CartModel() {
    return _instance;
  }

  final List<int> _itemIds = [];

  CatalogModel get() => _catalog;

  set(CatalogModel catalogParam) {
    this._catalog = catalogParam;
  }

  List<CatalogItem> get catalogItems =>
      _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      catalogItems.fold(0, (total, current) => total + current.price);

  void add(CatalogItem item) {
    _itemIds.add(item.id);
  }

  void remove(CatalogItem item) {
    _itemIds.remove(item.id);
  }
}
