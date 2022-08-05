import 'package:flutter/foundation.dart';
import 'product.dart';

class ProductData with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'l1',
      title: 'Parfume JB Classic',
      imageUrl: 'https://www.pschitt-pschitt.fr/37758-thickbox_default/product.jpg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed leo odio. Etiam gravida iaculis mauris eu sagittis. ',
      price: 25.90,
    ),
    Product(
      id: 'l2',
      title: 'Parfume JB Classic',
      imageUrl: 'https://www.pschitt-pschitt.fr/37758-thickbox_default/product.jpg',
      description: 'parfume by JB',
      price: 25.90,
    ),
    Product(
      id: 'l3',
      title: 'Parfume JB Classic',
      imageUrl: 'https://www.pschitt-pschitt.fr/37758-thickbox_default/product.jpg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed leo odio. Etiam gravida iaculis mauris eu sagittis. ',
      price: 25.90,
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  void getProduct() {}

  void addProduct() {}

  void deleteProduct() {}
}