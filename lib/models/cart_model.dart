import 'package:ecommerce/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int numOfItem;

  CartModel({required this.product, required this.numOfItem});
}

List<CartModel> cartItems = [
  CartModel(product: productsList[0], numOfItem: 2),
  CartModel(product: productsList[1], numOfItem: 1),
  CartModel(product: productsList[3], numOfItem: 1),
];
