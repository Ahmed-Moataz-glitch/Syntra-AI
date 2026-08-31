# 🌟 Syntra.AI — Next-Gen AI Learning & Career Acceleration Platform

<p align="center">
  <img src="assets/images/splash_ios_android_12.png" alt="Syntra.AI Logo" width="120" />
</p>

<p align="center">
  <b>An intelligent ecosystem merging personalized education, team collaboration, and automated recruitment into one seamless, AI-verified workflow.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.6.1+-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.6.1+-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Architecture-Clean%20Architecture-4CAF50?style=for-the-badge" alt="Clean Architecture" />
  <img src="https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blueviolet?style=for-the-badge" alt="BLoC/Cubit" />
  <img src="https://img.shields.io/badge/Backend-Supabase%20%26%20Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Supabase & Firebase" />
  <img src="https://img.shields.io/badge/Localization-English%20%7C%20العربية%20(RTL)-E91E63?style=for-the-badge" alt="Localization" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License" />
</p>

---

## 📖 Table of Contents

- [Overview](#-overview)
- [The 4-Stage Smart Workflow](#-the-4-stage-smart-workflow)
- [Key Personas & Features](#-key-personas--features)
  - [🎓 The Learner](#-the-learner)
  - [👥 The Team](#-the-team)
  - [💼 The Recruiter](#-the-recruiter)
- [Architecture & Design Pattern](#-architecture--design-pattern)
- [Project Directory Structure](#-project-directory-structure)
- [Technology Stack & Dependencies](#-technology-stack--dependencies)
- [Backend & AI Microservices Ecosystem](#-backend--ai-microservices-ecosystem)
- [Getting Started & Installation](#-getting-started--installation)
- [Configuration & Environment](#-configuration--environment)
- [Screenshots & UI Showcase](#-screenshots--ui-showcase)
- [Author & Acknowledgments](#-author--acknowledgments)
- [License](#-license)

---

## 🚀 Overview

**Syntra.AI** is a mobile application built with Flutter that revolutionizes how developers learn, collaborate, and get hired. By leveraging state-of-the-art AI microservices, Syntra.AI bridges the gap between academic education and industry employment through automated skill assessments, customized roadmaps, real-world verified projects, automated task distribution, and voice-enabled mock technical interviews.

### Core Value Propositions:
- 🎯 **Hyper-Personalized Learning**: AI scans user interests and skill levels to construct real-time evolving roadmaps.
- 🤝 **Intelligent Team Collaboration**: Automatically decomposes projects into tasks and assigns them based on team members' unique strengths.
- 🎙️ **Interactive AI Voice Mock Interviews**: Conduct real-time voice and text interviews with automated feedback and scoring.
- 🛡️ **Verified Skill Proof**: Move beyond traditional resumes—recruiters evaluate candidates through verified project benchmarks and technical track completions.

---

## 🔄 The 4-Stage Smart Workflow

Syntra.AI operates on a continuous, 4-stage pipeline built for the future of tech careers:

```mermaid
graph LR
    P1[<b>Phase 1</b><br/>AI Analysis & Onboarding] --> P2[<b>Phase 2</b><br/>Dynamic Roadmap]
    P2 --> P3[<b>Phase 3</b><br/>Build & Verification]
    P3 --> P4[<b>Phase 4</b><br/>CV Generation & Hiring]
    P4 -.->|Continuous Upskilling| P2
```

1. **Phase 1: AI Analysis & Onboarding** — Diagnostic evaluation of passions, skills, and goals to match the user with optimal tech tracks.
2. **Phase 2: Dynamic Roadmap** — AI-generated living, weekly roadmap that dynamically updates as the learner progresses.
3. **Phase 3: Build & Verification** — Building real-world projects with automated code evaluation, quality grading, and quiz assessments.
4. **Phase 4: CV Generation & Direct Hiring** — Automatically compiling verified achievements into an interactive portfolio, connecting candidates directly to top recruiters.

---

## 🌟 Key Personas & Features

### 🎓 The Learner
- **Track Recommendation Engine**: 10-question adaptive assessment to discover the optimal career path, or manual track selection.
- **Dynamic AI Roadmap**: Weekly structured roadmap detailing milestones, essential skills, and curated learning resources.
- **AI Quiz Generation & Key Point Extraction**: Automated assessment quizzes generated per topic to validate retention and progress.
- **Project Recommendations & Evaluation**: Real-world project assignments with automated AI submission grading and actionable feedback.
- **Progress Tracking & Badges**: Persist finished skills and tracks with local caching and cloud sync.

### 👥 The Team
- **Team Workspace Setup**: Define team members and their domain skillsets.
- **AI Task Decomposition & Assignment**: Input project requirements; AI breaks them into sub-tasks and assigns them based on member competency scores.
- **Skill Gap & Unassigned Task Detection**: Identifies tasks that don't match the current team's skillset, highlighting areas for hiring or upskilling.

### 💼 The Recruiter
- **Talent Discovery Hub**: Browse verified candidates based on finished tracks, verified projects, and skill badges.
- **AI Mock Technical Interview**:
  - Voice-driven Technical Interviews with Speech-to-Text (STT) and Text-to-Speech (TTS).
  - Multi-turn technical dialogue with AI interviewers.
  - Comprehensive post-interview scoring, session status tracking, and performance analytics.

---

## 🏗️ Architecture & Design Pattern

Syntra.AI follows the **Clean Architecture** paradigm combined with the **BLoC / Cubit** pattern for robust, testable, and scalable state management.

```
                  ┌─────────────────────────────────────────┐
                  │           Presentation Layer            │
                  │   (Pages, Widgets, BLoC / Cubits)       │
                  └────────────────────┬────────────────────┘
                                       │
                                       ▼
                  ┌─────────────────────────────────────────┐
                  │              Domain Layer               │
                  │   (Entities, Use Cases, Repositories)   │
                  └────────────────────┬────────────────────┘
                                       │
                                       ▼
                  ┌─────────────────────────────────────────┐
                  │               Data Layer                │
                  │ (Data Sources, DTOs, API & Local Cache) │
                  └─────────────────────────────────────────┘
```

### Architectural Highlights:
- **Separation of Concerns**: UI is completely decoupled from business logic and network/data handling.
- **State Management**: `flutter_bloc` (Cubits) managing granular state flows for Auth, Home, Learn, Community, Profile, Theme, and Language.
- **Local Persistence & Caching**: Fast local NoSQL storage with `Hive` (TypeAdapters for user profile and roadmaps) and `SharedPreferences`.
- **Secure Token Storage**: Sensitive auth credentials and tokens stored securely via `flutter_secure_storage`.
- **Bilingual i18n & RTL Support**: Full support for English and Arabic with automated locale switching, RTL layout handling, and custom typography (`NotoSansArabic`).
- **Responsive Layout**: Pixel-perfect UI across all screen sizes powered by `flutter_screenutil`.

---

## 📂 Project Directory Structure

```plaintext
syntra_ai/
├── android/                        # Android platform specific files
├── ios/                            # iOS platform specific files
├── assets/
│   ├── fonts/                      # Custom fonts (NotoSansArabic)
│   ├── icons/                      # SVG icons (auth, social, brand)
│   ├── images/                     # Graphic assets and splash screens
│   └── lotties/                    # Smooth Lottie animations (robot, learner, team, employer)
├── lib/
│   ├── core/                       # Core shared utilities, widgets, and view models
│   │   ├── utils/                  # App colors, themes, routes, API endpoints, toasts, storage
│   │   ├── view/                   # Shared screens (Onboarding) and reusable widgets
│   │   └── view_model/             # Global Cubits (LanguageCubit, ThemeCubit)
│   ├── features/                   # Feature-first modular architecture
│   │   ├── auth/                   # Authentication (Login, Register, OTP, Password Reset, OAuth)
│   │   │   ├── data/               # Auth API, DTOs, Data Sources, Repo Implementations
│   │   │   ├── domain/             # Auth Entities, Repo Interfaces, Use Cases
│   │   │   └── presentation/       # Auth UI Screens, Custom Fields, Auth Cubit
│   │   ├── home/                   # Home Dashboard, Role Selection, Workflow Explanations
│   │   ├── learn/                  # Roadmaps, Quizzes, Projects, Team Task Assignment
│   │   │   ├── data/               # Learn API, Roadmap DTOs, Task Models, Hive Adapters
│   │   │   ├── domain/             # Learn Entities, Use Cases (Roadmap, Quiz, Tasks, Projects)
│   │   │   └── presentation/       # Learner/Team/Recruiter screens, Quiz pages, Learn Cubit
│   │   ├── community/              # Mock Interviews, Voice STT/TTS, Candidate Discovery
│   │   │   ├── data/               # Community API, Interview DTOs, Audio Processing
│   │   │   ├── domain/             # Interview Entities, Speech Use Cases
│   │   │   └── presentation/       # Interview Voice/Chat UI, Recruiter Talent Hub
│   │   └── profile/                # User Profile, Track History, Theme/Language Settings
│   ├── generated/                  # Generated localization & internationalization files
│   ├── l10n/                       # Localization ARB translation files (English & Arabic)
│   ├── firebase_options.dart       # Firebase configuration
│   └── main.dart                   # Application entry point & service initialization
├── pubspec.yaml                    # Package dependencies and asset configuration
└── README.md                       # Project documentation
```

---

## 💻 Technology Stack & Dependencies

| Category | Technology / Package | Purpose |
| :--- | :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev/) (v3.6.1+) | Cross-platform UI Toolkit |
| **Language** | [Dart](https://dart.dev/) (v3.6.1+) | Fast, Object-Oriented Language |
| **State Management** | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | Predictable state management via Cubits |
| **Backend & Auth** | [`supabase_flutter`](https://pub.dev/packages/supabase_flutter), [`firebase_auth`](https://pub.dev/packages/firebase_auth), [`google_sign_in`](https://pub.dev/packages/google_sign_in), [`flutter_web_auth_2`](https://pub.dev/packages/flutter_web_auth_2) | Multi-provider authentication (Email, Google, GitHub) & DB |
| **Local Storage** | [`hive_flutter`](https://pub.dev/packages/hive_flutter), [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage), [`shared_preferences`](https://pub.dev/packages/shared_preferences) | NoSQL caching, encrypted token storage & key-value preferences |
| **Networking** | [`http`](https://pub.dev/packages/http) | REST API communication with AI microservices |
| **UI & Responsiveness** | [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil), [`skeletonizer`](https://pub.dev/packages/skeletonizer), [`toastification`](https://pub.dev/packages/toastification) | Dynamic screen scaling, loading skeletons & modern toasts |
| **Animations** | [`animate_do`](https://pub.dev/packages/animate_do), [`lottie`](https://pub.dev/packages/lottie), [`animated_text_kit`](https://pub.dev/packages/animated_text_kit) | Fluid micro-interactions & vector animations |
| **Internationalization** | [`flutter_localizations`](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html), [`intl`](https://pub.dev/packages/intl) | English and Arabic (RTL) localization |
| **Cloud Messaging & Analytics** | [`firebase_messaging`](https://pub.dev/packages/firebase_messaging), [`firebase_crashlytics`](https://pub.dev/packages/firebase_crashlytics) | Push notifications and crash monitoring |
| **Network Resilience** | [`flutter_offline`](https://pub.dev/packages/flutter_offline) | Real-time connectivity monitoring |

---

## 🌐 Backend & AI Microservices Ecosystem

Syntra.AI interacts with a decoupled suite of dedicated AI and backend microservices:

| Service | Responsibility |
| :--- | :--- |
| 🔐 **Auth & User Service** | User registration, login, profile management, OTP verification, and secure session management. |
| 🧭 **Recommendation System** | Analyzes diagnostic questionnaire answers to recommend targeted learning tracks. |
| 🗺️ **Roadmap Generation Service** | Generates dynamic, weekly-structured roadmaps with required skills and curated learning materials. |
| 📝 **Quiz & Key Point Service** | Extracts key concepts from track modules and generates dynamic quizzes. |
| 💻 **Project Recommendation & Evaluation** | Recommends relevant real-world project scenarios and grades code/solution submissions. |
| 🤝 **Task Distribution Service** | Breaks down project descriptions into modular tasks and assigns them based on team competencies. |
| 🎙️ **Mock Interview & Voice Engine** | Handles interactive technical interviews, Speech-to-Text (STT), and Text-to-Speech (TTS). |

---

## 🛠️ Getting Started & Installation

### Prerequisites
Make sure you have the following installed on your machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.6.1`)
- [Dart SDK](https://dart.dev/get-dart) (`>= 3.6.1`)
- [Android Studio](https://developer.android.com/studio) / [Xcode](https://developer.apple.com/xcode/)
- Git

### Installation Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Ahmed-Moataz-glitch/Syntra-AI.git
   cd Syntra-AI
   ```

2. **Install Flutter Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run Code Generation (Hive & DTO Adapters):**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Generate Localization Files (if modified):**
   ```bash
   flutter pub run intl_utils:generate
   ```

5. **Run the Application:**
   ```bash
   # Run on connected Android / iOS device or emulator
   flutter run
   ```

---

## ⚙️ Configuration & Environment

### Firebase Setup
1. Register your app in the [Firebase Console](https://console.firebase.google.com/).
2. Place your `google-services.json` inside `android/app/` and `GoogleService-Info.plist` inside `ios/Runner/`.
3. Configure `lib/firebase_options.dart` via FlutterFire CLI.

### Supabase & OAuth Setup
1. Set up your Supabase project with GitHub / Google OAuth credentials.
2. Ensure your redirect URI schemes are configured for Android (`android/app/src/main/AndroidManifest.xml`) and iOS (`ios/Runner/Info.plist`).

---

## 📱 Screenshots & UI Showcase

<p align="center">
  <!-- Placeholders for project preview screenshots -->
  <img src="assets/images/splash_ios_android_12.png" width="30%" alt="Splash & Onboarding" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="assets/images/splash_ios_android_11.png" width="30%" alt="Auth Screen" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="assets/images/default_user_profile_image.jpg" width="30%" alt="Profile Screen" />
</p>

---

## 👨‍💻 Author & Acknowledgments

**Developed with ❤️ by Ahmed Moataz (Ahmed Glitch)**

- 🐙 **GitHub**: [@Ahmed-Moataz-glitch](https://github.com/Ahmed-Moataz-glitch)
- 💼 **LinkedIn**: [Ahmed Moataz](https://www.linkedin.com/in/ahmed-moataz-b50a2b252/)
- 📧 **Email**: [Contact via GitHub](https://github.com/Ahmed-Moataz-glitch)

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE.md](LICENSE.md) file for details.
