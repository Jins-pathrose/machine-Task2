import 'package:flutter/material.dart';
import 'package:machinetask/Controller/home_provider.dart';
import 'package:machinetask/View/Widgets/home_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'SHOEVIBE',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          CustomCartIcon(), 
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          CustomSearchBar(homeProvider: homeProvider), 
          CustomCategoryChips(homeProvider: homeProvider), 
          Expanded(
            child: homeProvider.filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: homeProvider.filteredProducts.length,
                    itemBuilder: (context, index) {
                      return CustomProductCard(
                        product: homeProvider.filteredProducts[index],
                        homeProvider: homeProvider,
                      ); 
                    },
                  ),
      )],
      ),
    );
  }
}