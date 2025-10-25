# 🍳 Recipe Manager App

A simple Flutter app built using **BLoC (Business Logic Component)** architecture for managing recipes.  
Users can **add**, **view**, and **filter recipes by category**, with a clean and modular folder structure.

---

## 📁 Project Structure

```
lib
│
├── common/
│   └── widgets/
│       └── custom_field.dart
│
├── features/
│   ├── add_recipe/
│   │   └── screen/
│   │       └── add_recipe_screen.dart
│   │
│   ├── navigation/
│   │   └── recipe_details/
│   │       └── screen/
│   │           └── recipe_details_screen.dart
│   │
│   └── recipes/
│       ├── bloc/
│       │   ├── bloc/
│       │   │   ├── recipe_bloc_bloc.dart
│       │   │   ├── recipe_bloc_event.dart
│       │   │   └── recipe_bloc_state.dart
│       │
│       └── screen/
│           └── recipies_screen.dart
│
├── models/
│   ├── recipe_model.dart
│   └── recipe_model.mapper.dart
│
├── services/
│   ├── setup.dart
│   └── main.dart
```

---

## 🧠 Features

- Add new recipes with **title**, **description**, **ingredients**, **steps**, and **category**  
- Filter recipes by **category** dynamically  
- View full recipe details with a clean **expanding sections UI**  
- Built with the **BLoC pattern** for scalable and maintainable state management  
- Organized modular structure for clear separation of concerns  

---

## 🎥 Demo Video



https://github.com/user-attachments/assets/ad1067e6-83b7-45e0-a698-f3160c1f6019


---

## ✨ Bonus Section

- Implemented **Dropdown filtering** connected directly to Bloc state  and shows the only available categories based on the recepies added
- Used Enum With Categories for Better Selection
- Clean UI for recipe details using **ExpansionTiles** for ingredients and steps  


---



## 🛠 Tech Stack

- **Flutter** (UI Framework)
- **BLoC / flutter_bloc** (State Management)
- **GoRouter** (Navigation)
- **Dart** (Programming Language)

---

## 👨‍💻 Author

**Omar Alharbi**  

