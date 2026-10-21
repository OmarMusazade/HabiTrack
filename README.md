# HabiTrack
A habit tracking program that aims to hit your dopamine receptors to develop healthy routines
# HabiTrack

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)

HabiTrack is a native iOS application built entirely with SwiftUI, designed to help users build positive routines and break bad habits. The application provides a fast, fluid, and intuitive native experience for logging daily activities, monitoring streaks, and visualizing personal progress. 

## 📸 Screenshots

*(Create a folder named `screenshots` in your repository, upload your images, and uncomment the lines below to display them)*

<!-- 
![Welcome Screen](screenshots/welcome_view.png) 
![Habit List](screenshots/habit_list.png) 
-->

## ✨ Features

* **Intuitive Daily Logging:** Quickly mark habits as complete or incomplete with native iOS gestures.
* **Progress Tracking:** Monitor current and longest consecutive completion streaks.
* **Customizable Goals:** Add, edit, or remove daily habits as routines evolve.
* **Native Apple Experience:** Built 100% in SwiftUI for a seamless, responsive UI that adapts to system settings like Dark Mode.

## 🏗 Architecture & Tech Stack

This project was developed with a strong emphasis on clean code and structural discipline, utilizing the **MVVM (Model-View-ViewModel)** architectural pattern to ensure a strict separation of concerns between the user interface and business logic.

* **Language:** Swift
* **UI Framework:** SwiftUI
* **Architecture:** MVVM
* **Data Management:** Handled via custom service layers (`HabitService.swift`).

## 🚀 Getting Started

### Prerequisites
* **macOS:** Required for Xcode.
* **IDE:** Xcode 15.0 or newer.
* **Target:** iOS 16.0+ (Tested on iPhone Simulator & Physical Device).

### Installation
1. Clone the repository to your local machine:
   ```bash
   git clone [https://github.com/OmarMusazade/HabiTrack.git](https://github.com/OmarMusazade/HabiTrack.git)
