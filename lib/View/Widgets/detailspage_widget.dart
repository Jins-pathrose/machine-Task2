import 'package:flutter/material.dart';
import 'package:machinetask/Controller/cart_provider.dart';
import 'package:machinetask/Model/model.dart';
import 'package:machinetask/View/CartPage/cartpage.dart';
import 'package:provider/provider.dart';

// Custom Back Button Widget
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

// Custom Favorite Button Widget
class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite_border, color: Colors.red),
        ),
        onPressed: () {
          // Add to favorites
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to favorites')),
          );
        },
      ),
    );
  }
}

// Product Image Widget
class ProductImage extends StatelessWidget {
  final ShoeProduct product;

  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Hero(
        tag: product.id,
        child: Image.asset(
          product.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Product Details Widget
class ProductDetails extends StatelessWidget {
  final ShoeProduct product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Ratings
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '4.0 (245 reviews)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Size selection
          Text(
            'Select Size',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 8),

          // Size chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12]
                  .map((size) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(
                            size.toString(),
                            style: TextStyle(
                              color: size == 9
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          backgroundColor: size == 9
                              ? Colors.blue.shade700
                              : Colors.grey.shade200,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ))
                  .toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            'Description',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                product.description,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Add to cart button
          ElevatedButton(
            onPressed: () {
              // Access the shared CartProvider instance
              final cartProvider =
                  Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(product); // Add the product to the cart
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to cart'),
                  action: SnackBarAction(
                    label: 'VIEW CART',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}