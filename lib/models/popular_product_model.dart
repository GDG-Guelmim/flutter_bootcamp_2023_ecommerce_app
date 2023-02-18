class PopularProductModel {
  final String title, imagePath;
  final String price;
  final bool isFavorite;

  PopularProductModel({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.isFavorite,
  });
}

List<PopularProductModel> popularProductsList = [
  PopularProductModel(
    title: "Wireless Controller for PS4™",
    price: "\$64.99",
    isFavorite: true,
    imagePath: "assets/images/ps4_console_white_1.png",
  ),
  PopularProductModel(
    title: "Nike Sport White - Man Pants",
    price: "\$50.50",
    isFavorite: false,
    imagePath: "assets/images/Image Popular Product 2.png",
  ),
  PopularProductModel(
    title: "Outdoor Sports Bike Black Gloves",
    price: "\$15.49",
    isFavorite: false,
    imagePath: "assets/images/glap.png",
  ),
  PopularProductModel(
    title: "Wireless Bluetooth Headset Bass Boost",
    price: "\$43.99",
    isFavorite: true,
    imagePath: "assets/images/wireless headset.png",
  ),
];
