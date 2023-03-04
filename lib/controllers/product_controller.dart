import 'package:ecommerce/models/product_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
}
