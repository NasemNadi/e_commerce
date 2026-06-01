# 🛍️ E-Commerce App

A modern, scalable, and fully functional E-Commerce mobile application built using **Flutter** and **Dart** with a clean architecture approach.

---

## ✨ Features
* **Dynamic Home Screen:** Features categorized sections for Brands (with emoji logic), Categories, and personalized "Best For You" products.
* **State Management:** Powered by **Bloc/Cubit** for seamless and reactive UI updates.
* **Local Caching:** Utilizes **SharedPreferences** (built as a Singleton) for secure token management and session persistence.
* **Robust Networking:** API integrations handled using **Dio** client with custom interceptors and centralized error handling.
* **Modern UI/UX:** Clean design utilizing dynamic grid views, custom Section Headers, and a smooth Bottom Navigation Bar.

---

## 🏗️ Architecture & Design Patterns
The project follows modular software design principles to ensure clean separation of concerns and maintainability:
* **MVVM / Layered Architecture:** Organized into `Core` (reusable utilities, network clients, helpers) and `Features` (presentation, logic, and data handling).
* **Singleton Pattern:** Implemented for core services like `ApiService` and `CacheHelper` to optimize memory and ensure single-source-of-truth data flow.

---

## 🛠️ Tech Stack & Packages
* **Framework:** [Flutter](https://flutter.dev) (Dart)
* **State Management:** `flutter_bloc`
* **Networking:** `dio`
* **Local Storage:** `shared_preferences`

---

> 💡 *Note: Replace placeholders with actual screenshots from your emulator/device to make the profile pop!*