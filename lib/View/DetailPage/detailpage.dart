import 'package:flutter/material.dart';
import 'package:machinetask/Model/model.dart';
import 'package:machinetask/View/Widgets/detailspage_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final ShoeProduct product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(), // Extracted widget
        actions: [
          CustomFavoriteButton(), // Extracted widget
        ],
      ),
      body: Column(
        children: [
          // Product Image
          Expanded(
            flex: 5,
            child: ProductImage(product: product), // Extracted widget
          ),

          // Product Details
          Expanded(
            flex: 6,
            child: ProductDetails(product: product), // Extracted widget
          ),
        ],
      ),
    );
  }
}