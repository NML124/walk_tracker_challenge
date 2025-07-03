# Walk Tracker Challenge

A Flutter learning project focused on advanced animation techniques, inspired by a challenge animation seen on [YouTube](https://www.youtube.com/shorts/HVFTkE5_SHA).

## Project Purpose

This project is for educational purposes, aiming to deepen understanding of animation in Flutter. It reproduces a visually rich walk tracker UI, featuring:
- 3D character animation (using a model modified in Blender)
- Circular progress animations (built with [Rive](https://rive.app/))
- Smooth page transitions and animated cards

## Key Resources & Inspirations

- **3D Model:** Downloaded from [fab.com](https://www.fab.com/) and customized in Blender.
- **Rive:** Used for creating and controlling circular progress animations ([rive.app](https://rive.app/)).
- **Flutter Animation Conference:** [Marcin Szałek's talk](https://www.youtube.com/watch?v=FCyoHclCqc8) provided foundational knowledge for Flutter animations.
- **Flutter Documentation & Packages:** Leveraged official docs and open-source packages for best practices.

## Features

- Animated 3D character (O3D package)
- Rive-powered circular progress indicators for steps, calories, and sleep
- Animated feature cards and smooth page transitions
- Multi-language support (English, French)
- Theming (light/dark mode)

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (usually included with Flutter)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) (recommended)

### Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/NML124/walk_tracker_challenge.git
   cd walk_tracker_challenge
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```

### Assets
- 3D model: `assets/anim/anim.glb`
- Rive animation: `assets/rive/circle.riv`

If you want to modify the 3D model, you can use Blender or any compatible 3D software that supports exporting to the `.glb` format.

## Project Structure

- `lib/` — Main source code
  - `core/` — Shared widgets, themes, localization, animation controllers
  - `features/` — Feature modules (daily activities, journal, account, user auth)
  - `main.dart` — App entry point
- `assets/` — 3D models, Rive files, fonts, and images

## Learning References
- [Flutter Animations Documentation](https://docs.flutter.dev/development/ui/animations)
- [Rive Documentation](https://help.rive.app/runtimes/flutter/)
- [O3D package](https://pub.dev/packages/o3d)
- [Marcin Szałek's Animation Conference](https://www.youtube.com/watch?v=FCyoHclCqc8)

## License

This project is for learning and demonstration purposes only. Please respect the licenses of any third-party assets or packages used.
