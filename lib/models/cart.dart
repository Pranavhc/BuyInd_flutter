import 'package:buyind/core/store.dart';
import 'package:buyind/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
// catalog field - private variable
  late CatalogModel _catalog;
// store IDs of items
  final List<int> _itemIds = [];

// get catalog - getter
  CatalogModel get catalog => _catalog;

// set catalog - setter
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != Null);
    _catalog = newCatalog;
  }

// Get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

// get total price
  num get totalPrice =>
      //         (prev val,curr val) = prev val + curr vals price
      items.fold(0, (total, current) => total + current.price);
}

//add item
class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

// remove item
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
