import 'package:farmingapp/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      id: '1',
      title: 'NPK Fertilizer',
      image: 'assets/images/fertilizer.jpg',
      price: '4500',
      unit: '50kg',
      isFeatured: true,
    ),
    ProductModel(
      id: '2',
      title: 'DAP Fertilizer',
      image: 'assets/images/apples.jpg',
      price: '5300',
      unit: '50kg',
      isFeatured: true,
    ),
    ProductModel(
      id: '3',
      title: 'Hybrid Tomato Seeds',
      image: 'assets/images/tomatos.jpg',
      price: '180',
      unit: 'packet',
      isFeatured: true,
    ),
    ProductModel(
      id: '4',
      title: 'Paddy Pusa Basmati',
      image: 'assets/images/rice.jpg',
      price: '120',
      unit: 'kg',
      isFeatured: true,
    ),
  ];

  List<ProductModel> get products => [..._products];
}
