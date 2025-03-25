import 'package:flutter/material.dart';
import 'package:machinetask/Model/model.dart';

class HomeProvider extends ChangeNotifier {
  List<ShoeProduct> _filteredProducts = dummyProducts;
  String _searchQuery = '';
  String _selectedCategory = 'All';
  List<ShoeProduct> _favoriteItems = [];

  // Getters
  List<ShoeProduct> get filteredProducts => _filteredProducts;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<ShoeProduct> get favoriteItems => _favoriteItems;

  // Category mapping function
  String _getProductCategory(ShoeProduct product) {
    // Map products to categories based on name or other properties
    final name = product.name.toLowerCase();
    
    if (name.contains('running') || name.contains('jogger')) {
      return 'Running';
    } else if (name.contains('basketball') || name.contains('jordan')) {
      return 'Basketball';
    } else if (name.contains('hiking') || name.contains('trail')) {
      return 'Hiking';
    } else if (name.contains('training') || name.contains('gym')) {
      return 'Training';
    } else if (name.contains('casual') || name.contains('lifestyle')) {
      return 'Casual';
    }
    
    // Default category based on brand or other criteria
    if (name.contains('nike')) {
      return 'Running';
    } else if (name.contains('adidas')) {
      return 'Training';
    }
    
    return 'Casual'; // Default category
  }

  // Apply both search and category filters
  void _applyFilters() {
    // First filter by search query
    List<ShoeProduct> searchFiltered = dummyProducts
        .where((product) => 
            product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
        
    // Then filter by category if not "All"
    if (_selectedCategory == 'All') {
      _filteredProducts = searchFiltered;
    } else {
      _filteredProducts = searchFiltered
          .where((product) => _getProductCategory(product) == _selectedCategory)
          .toList();
    }
    
    notifyListeners();
  }

  // Other methods remain the same...
  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void toggleFavorite(ShoeProduct product) {
    final index = _favoriteItems.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _favoriteItems.removeAt(index);
    } else {
      _favoriteItems.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(ShoeProduct product) {
    return _favoriteItems.any((item) => item.id == product.id);
  }

  void resetFilters() {
    _searchQuery = '';
    _selectedCategory = 'All';
    _filteredProducts = dummyProducts;
    notifyListeners();
  }
}