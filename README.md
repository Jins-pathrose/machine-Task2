# Shoe Store - Flutter E-Commerce App

A Flutter e-commerce application for browsing and purchasing shoes, featuring product listings, detailed views, cart functionality, and user authentication.

## Features

- **User Authentication**
  - Login screen with email/password validation
  - Session persistence using SharedPreferences
  - Logout functionality

- **Product Browsing**
  - Clean product grid/list view
  - Search functionality to filter shoes by name
  - Product details page with images and descriptions

- **Shopping Cart**
  - Add/remove products from cart
  - Quantity adjustment
  - Real-time cart total calculation
  - Persistent cart icon with item count

- **App Architecture**
  - MVC (Model-View-Controller) pattern
  - Provider for state management
  - Clear separation of concerns

## Screenshots

not added

## Technical Implementation

### Architecture
- **MVC Pattern**
  - Models: Product, Cart, User
  - Views: UI components and screens
  - Controllers: Business logic handlers

### State Management
- Provider package for efficient state management
- ChangeNotifier for reactive UI updates
- Centralized state for cart and user session

### Data Persistence
- SharedPreferences for:
  - User session persistence
  - Cart item persistence between sessions

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  shared_preferences: ^2.2.2
  flutter_svg: ^2.0.7
  cached_network_image: ^3.3.0
  intl: ^0.18.1
```

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio/Xcode (for emulator/simulator)


## Folder Structure

```
lib/
├── controllers/        # Business logic controllers
├── models/             # Data models
├── views/              # UI components and screens
├── widgets/            # Reusable widgets
├── services/           # Helper services
└── main.dart           # App entry point
```

## Future Enhancements

- Implement user registration
- Add product categories and filtering
- Integrate with a real backend API
- Add payment gateway integration
- Implement order history

## Contribution

Contributions are welcome! Please fork the repository and create a pull request with your changes.



Developed by JINS PATHROSE  
jinspathrose560@gmail.com