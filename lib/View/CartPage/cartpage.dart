import 'package:flutter/material.dart';
import 'package:machinetask/Controller/cart_provider.dart';
import 'package:machinetask/View/Widgets/cart_widget.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the shared CartProvider instance
    final cartProvider = Provider.of<CartProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_bag_outlined, color: theme.primaryColor),
          ),
        ],
      ),
      body: cartProvider.cartItems.isEmpty 
          ? _buildEmptyCart(context) 
          : _buildCartList(context, cartProvider),
      bottomNavigationBar: cartProvider.cartItems.isEmpty 
          ? null 
          : _buildCheckoutBar(context, cartProvider),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items to get started',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Go back to products
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Start Shopping',
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(BuildContext context, CartProvider cartProvider) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: cartProvider.cartItems.length,
      itemBuilder: (context, index) {
        final product = cartProvider.cartItems[index];
        return CartItemCard(
          product: product,
          cartProvider: cartProvider,
        ); // Extracted widget
      },
    );
  }

  Widget _buildCheckoutBar(BuildContext context, CartProvider cartProvider) {
    return CheckoutBar(cartProvider: cartProvider); // Extracted widget
  }
}