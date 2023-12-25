import 'package:flutter/material.dart';

@immutable
final class ProductModel {
  final String pictureUrl;
  final String productName;
  final String productId;
  final String productPrice;

  const ProductModel({required this.pictureUrl, required this.productName, required this.productId, required this.productPrice});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(pictureUrl: json['picture_url'], productName: json['product_name'], productId: json['product_id'], productPrice: json['product_price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, String>{'picture_url': pictureUrl, 'product_name': productName, 'product_id': productId, 'product_price': productPrice};
    return data;
  }
}
