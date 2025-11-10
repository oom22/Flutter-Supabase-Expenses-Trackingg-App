# 💾 Supa Project (Flutter + Supabase)

This project is a **Win95-styled Expense Management App** built with
**Flutter** and **Supabase**. It allows users to sign up, sign in, add,
edit, and delete expenses --- all displayed in a nostalgic Windows 95 UI
using `flutter95`.

------------------------------------------------------------------------

## 🧱 Project Structure

    lib/
    ├── features/
    │   ├── add_expense/
    │   │   └── add_expense_screen.dart
    │   ├── auth/
    │   │   ├── bloc/
    │   │   │   ├── auth_bloc.dart
    │   │   │   ├── auth_event.dart
    │   │   │   └── auth_state.dart
    │   │   ├── sign_in/
    │   │   │   └── sign_in_screen.dart
    │   │   └── sign_up/
    │   │       └── sign_up_screen.dart
    │   ├── bloc/
    │   │   └── bloc/
    │   │       ├── expenses_bloc.dart
    │   │       ├── expenses_event.dart
    │   │       └── expenses_state.dart
    │   ├── edit_expense/
    │   │   └── edit_expense_screen.dart
    │   ├── expense_details/
    │   │   └── expense_details_screen.dart
    │   └── expenses_list/
    │       └── expenses_list_screen.dart
    │
    ├── models/
    │   ├── expense_model.dart
    │   └── expense_model.mapper.dart
    │
    └── main.dart

------------------------------------------------------------------------

## 🧠 Features

-   🪟 **Win95 UI Design** using the `flutter95` package
-   🔑 **Authentication System** (Sign Up / Sign In) via Supabase
-   💰 **Expense Management**
    -   Add, edit, delete, and view expense entries
    -   Categories: Food, Transportation, Bills, Entertainment, Health
-   🧭 **Bloc Architecture** for scalable state management
-   📅 **Supabase Database Integration**
-   🚪 **Logout Functionality**

------------------------------------------------------------------------

## ⚙️ Tech Stack

  Technology      Description
  --------------- ----------------------------------------------
  **Flutter**     Frontend framework for cross-platform apps
  **Supabase**    Backend-as-a-Service (auth + database)
  **Bloc**        State management pattern
  **flutter95**   Retro-styled UI package mimicking Windows 95

------------------------------------------------------------------------

## 🧑‍💻 Developed By

**Omar Alharbi**\
💡 Built with Flutter, Supabase, and a love for retro design ✨

------------------------------------------------------------------------

## 📷 Demo



https://github.com/user-attachments/assets/2b7ef4c7-58e5-46ae-8294-d45208113a57



