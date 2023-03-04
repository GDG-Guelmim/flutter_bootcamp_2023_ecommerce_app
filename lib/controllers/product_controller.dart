import 'package:ecommerce/models/product_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class ProductController extends GetxController {
  int imageSelected = 0;
  bool isFavorite = false;
  int colorSelected = 0;
  int productQuantity = 0;

  int _selectedImage = 0;
  int get selectedImage => _selectedImage;
  set selectedImage(int value) {
    _selectedImage = value;
    update();
  }

  void incrementQuantity() {
    productQuantity++;
    update();
  }

  void decrementQuantity() {
    if (productQuantity > 0) {
      productQuantity--;
      update();
    }
  }

  void toggleFavorite(ProductModel product) {
    product.isFavourite = !product.isFavourite;
    update();
  }

  void init() {
    _selectedImage = 0;
  }

  void addToCart(ProductModel product) {
    bool isAlreadyIn = false;
    for (var element in cartItems) {
      if (element.product.id == product.id) isAlreadyIn = true;
    }
    if (productQuantity > 0 && !isAlreadyIn) {
      cartItems.add(CartModel(product: product, numOfItem: productQuantity));
      Get.back();
    }
  }

  void removeFromCart(CartModel cart) {
    cartItems.remove(cart);
    update();
  }

  String getTotalPrice() {
    double value = 0;
    for (CartModel element in cartItems) {
      value += element.product.price * element.numOfItem;
    }
    return value.toStringAsFixed(2);
  }
}
