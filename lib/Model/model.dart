

class ShoeProduct {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;

  ShoeProduct({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

// Dummy Data with local asset images
final List<ShoeProduct> dummyProducts = [
  ShoeProduct(
    id: '1',
    name: 'Air Max 270',
    image: 'assets/mt1.jpeg',
    price: 149.99,
    description: 'The Nike Air Max 270 delivers a plush ride...Experience incredible energy return with the Ultraboost 21. The responsive Boost midsole and Primeknit+ upper adapt to your foot for a comfortable fit that helps you push your run forward.',
  ),
  ShoeProduct(
    id: '2',
    name: 'Ultraboost 21',
    image: 'assets/mt2.jpeg',
    price: 179.99,
    description: 'Experience incredible energy return with the Ultraboost 21. The responsive Boost midsole and Primeknit+ upper adapt to your foot for a comfortable fit that helps you push your run forward.',
  ),
  ShoeProduct(
    id: '3',
    name: 'Classic Leather',
    image: 'assets/mt3.jpeg',
    price: 89.99,
    description: 'The Reebok Classic Leather shoes showcase an iconic silhouette. With soft leather uppers, a die-cut EVA midsole, and a molded sockliner, these shoes offer both style and comfort for everyday wear.',
  ),
  ShoeProduct(
    id: '4',
    name: 'Chuck Taylor All Star',
    image: 'assets/mt4.jpeg',
    price: 59.99,
    description: 'The Chuck Taylor All Star is the classic sneaker that started it all. With its timeless silhouette and canvas upper, this iconic shoe offers versatile style that can be dressed up or down.',
  ),
  ShoeProduct(
    id: '5',
    name: 'Jordan 1 Retro High',
    image: 'assets/mt5.jpeg',
    price: 169.99,
    description: 'The Air Jordan 1 Retro High OG is one of the most iconic sneakers of all time. Featuring premium materials and classic colorways, this shoe delivers unmatched style and heritage.',
  ),
  ShoeProduct(
    id: '6',
    name: 'Old Skool',
    image: 'assets/machinetask.jpg',
    price: 69.99,
    description: 'The Vans Old Skool is a classic skate shoe with the iconic side stripe. Constructed with durable suede and canvas uppers, it features supportive padded collars for comfort and flexibility.',
  ),
];