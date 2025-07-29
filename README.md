# 🛍 E-Commerce Flutter App

A modern, feature-rich e-commerce mobile application built with Flutter, featuring a beautiful UI, secure authentication, shopping cart functionality, and seamless checkout experience.

## ✨ Features

### 🔐 Authentication & User Management
- *Multi-platform Authentication*: Google Sign-In, and Email/Password
- *Secure User Sessions*: Firebase Authentication with persistent login
- *User Profile Management*: View and manage user information

### 🏠 Home & Product Discovery
- *Product Catalog*: Browse products with beautiful grid layout
- *Category Filtering*: Shop by categories (Men, Women, Kids, Plus Size, Unisex)
- *Search Functionality*: Find products quickly with search bar
- *Product Details*: Rich product information with images, ratings, and descriptions
- *Best Sellers Section*: Highlighted popular products

### 🛒 Shopping Cart
- *Add to Cart*: Seamlessly add products to shopping cart
- *Cart Management*: View, update quantities, and remove items
- *Local Storage*: Cart data persists using SQLite database
- *Real-time Updates*: Live cart total calculation
- *Empty Cart State*: Beautiful empty cart illustration

### 💳 Checkout Process
- *Multi-step Checkout*: Address, delivery, and summary steps
- *Address Management*: Google Maps integration for location picking
- *Delivery Options*: Multiple delivery type selection
- *Order Summary*: Complete order review before purchase
- *Payment Integration*: Ready for payment gateway integration

### 🎨 User Interface
- *Modern Design*: Material Design 3 with custom theming
- *Dark/Light Theme*: Dynamic theme switching
- *Responsive Layout*: Optimized for different screen sizes
- *Smooth Animations*: Fluid transitions and micro-interactions
- *Custom Navigation*: Beautiful bottom navigation bar

## 🛠 Tech Stack

### Frontend
- *Flutter*: Cross-platform mobile development framework
- *Dart*: Programming language
- *Material Design 3*: Modern UI components

### State Management
- *Flutter Bloc*: Predictable state management
- *Cubit*: Lightweight state management for simple scenarios

### Backend & Services
- *Firebase*: Backend-as-a-Service
  - *Firebase Auth*: Authentication service
  - *Cloud Firestore*: NoSQL database
- *Google Maps*: Location services
- *Google Sign-In*: OAuth authentication

### Local Storage
- *SQLite*: Local database for cart management
- *Shared Preferences*: User session and settings storage

### Dependencies
- flutter_bloc: State management
- firebase_core, firebase_auth: Firebase services
- google_sign_in, flutter_facebook_auth: Social authentication
- cloud_firestore: Cloud database
- sqflite: Local database
- google_maps_flutter: Maps integration
- geolocator, geocoding: Location services
- flutter_svg: SVG image support
- awesome_dialog: Beautiful dialogs
- get_it: Dependency injection

## 📱 Screenshots
![1](https://github.com/user-attachments/assets/38a90eed-3bb2-483e-9638-23cccc9be03e)
![2](https://github.com/user-attachments/assets/2a2ea779-fcb5-4ad1-b7aa-163bb205633e)
![3](https://github.com/user-attachments/assets/91c4cc09-5aa2-4b30-89e1-77fa989736d9)
![4](https://github.com/user-attachments/assets/45ef1ebe-2aa3-4909-b108-619b72b96796)
![5](https://github.com/user-attachments/assets/18df462f-03eb-4bdc-b0da-ddbccf8c71ef)
![6](https://github.com/user-attachments/assets/b5b575f1-7325-490b-b6fe-723093088e86)
![7](https://github.com/user-attachments/assets/c423b6c1-93d3-4897-a090-3655d844b346)
![8](https://github.com/user-attachments/assets/f7984df5-5f28-4451-b2de-f461cf74e7e0)
![9](https://github.com/user-attachments/assets/c7e434f4-c257-4266-a87d-be3b116d5964)
![10](https://github.com/user-attachments/assets/6b6719da-fddd-446c-9ad1-c7565bcbbaee)
![11](https://github.com/user-attachments/assets/93192c05-022b-4e21-9329-c7ce60c1e5b4)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.7.2)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. *Clone the repository*
   bash
   git clone https://github.com/yourusername/ecommerce-flutter.git
   cd ecommerce-flutter
   

2. *Install dependencies*
   bash
   flutter pub get
   

3. *Firebase Setup*
   - Create a new Firebase project
   - Enable Authentication (Google, Facebook, Email/Password)
   - Enable Cloud Firestore
   - Download and add configuration files:
     - google-services.json for Android
     - GoogleService-Info.plist for iOS

4. *Configure Google Maps*
   - Enable Google Maps API in Google Cloud Console
   - Add API key to Android and iOS configurations

5. *Run the app*
   bash
   flutter run
   

## 📁 Project Structure


lib/
├── core/
│   ├── di/                 # Dependency injection
│   ├── helper/             # Utilities and constants
│   ├── routing/            # Navigation and routing
│   ├── service/            # Database and external services
│   └── theme/              # App theming
├── feature/
│   ├── auth/               # Authentication feature
│   ├── cart/               # Shopping cart feature
│   ├── checkout/           # Checkout process
│   ├── home/               # Home screen and products
│   └── profile/            # User profile
├── assets/
│   └── images/             # App images and icons
└── main.dart               # App entry point


## 🔧 Configuration

### Firebase Configuration
1. Add your Firebase configuration files to the respective platform folders
2. Update Firebase project settings in the Firebase Console
3. Configure authentication providers (Google, Facebook)

### Google Maps Configuration
1. Enable Google Maps API in Google Cloud Console
2. Add API key to android/app/src/main/AndroidManifest.xml
3. Add API key to ios/Runner/AppDelegate.swift

## 🧪 Testing

Run the test suite:
bash
flutter test


## 📦 Building for Production

### Android
bash
flutter build apk --release


### iOS
bash
flutter build ios --release


## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (git checkout -b feature/amazing-feature)
3. Commit your changes (git commit -m 'Add some amazing feature')
4. Push to the branch (git push origin feature/amazing-feature)
5. Open a Pull Request


## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Material Design team for design guidelines
- All contributors and supporters

## 📞 Contact

- *Developer*: Mohamed Ali Sayed
- *Email*: ma8510007gmail.com
- *LinkedIn*: https://www.linkedin.com/in/mohamed-ali-b3ab85320/
- *GitHub*: https://github.com/MooAli49

---

⭐ *Star this repository if you found it helpful!*
