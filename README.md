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
- [Demo Video](#-demo-video)
- [Screenshots & UI Showcase](#-screenshots--ui-showcase)
  - [🚀 Onboarding & Role Selection](#-onboarding--role-selection)
  - [🔐 Authentication & Security Flows](#-authentication--security-flows)
  - [🏠 Home & Ecosystem Hub](#-home--ecosystem-hub)
  - [🧭 Phase 1: Diagnostic Assessment & Track Recommendation](#-phase-1-diagnostic-assessment--track-recommendation)
  - [🗺️ Phase 2: Dynamic Roadmaps & Curated Resources](#-phase-2-dynamic-roadmaps--curated-resources)
  - [📝 AI Quizzes & Retention Validation](#-ai-quizzes--retention-validation)
  - [💻 Phase 3: Project Recommendations & Automated AI Grading](#-phase-3-project-recommendations--automated-ai-grading)
  - [👥 Team Workspace & AI Task Decomposition](#-team-workspace--ai-task-decomposition)
  - [💼 Phase 4: Recruiter Talent Discovery & Mock Interview Invitations](#-phase-4-recruiter-talent-discovery--mock-interview-invitations)
  - [👤 User Profiles, Dark Theme & Full Arabic RTL Localization](#-user-profiles-dark-theme--full-arabic-rtl-localization)
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

## 🎬 Demo Video

<div align="center">
  <video src="Syntra_AI.mp4" controls="controls" width="85%" style="max-height:600px; border-radius: 12px; box-shadow: 0 4px 14px rgba(0,0,0,0.18);">
    Your browser does not support the video tag.
  </video>
  <br/><br/>
  <p>
    <b>▶️ <a href="Syntra_AI.mp4">Click here to view or download the complete Syntra.AI Walkthrough Video</a></b>
  </p>
</div>

---

## 📱 Screenshots & UI Showcase

### 🚀 Onboarding & Role Selection
<table>
  <tr>
    <td align="center" width="25%">
      <img src="Screenshot_1770583171.png" width="100%" alt="Splash Screen" /><br/>
      <sub><b>Splash Screen</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782066414.png" width="100%" alt="Welcome to Syntra.AI" /><br/>
      <sub><b>1. Welcome & Intro</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782066423.png" width="100%" alt="Learner Flow" /><br/>
      <sub><b>2. Learner Flow</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782066427.png" width="100%" alt="Team Flow" /><br/>
      <sub><b>3. Team Flow</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" width="25%">
      <img src="Screenshot_1782066431.png" width="100%" alt="Employer Flow" /><br/>
      <sub><b>4. Employer Flow</b></sub>
    </td>
    <td align="center" width="25%"></td>
    <td align="center" width="25%"></td>
    <td align="center" width="25%"></td>
  </tr>
</table>

### 🔐 Authentication & Security Flows
<table>
  <tr>
    <td align="center" width="20%">
      <img src="Screenshot_1781385341.png" width="100%" alt="Sign Up" /><br/>
      <sub><b>Multi-Role Sign Up</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1781385436.png" width="100%" alt="Sign In" /><br/>
      <sub><b>Sign In (Email / Social)</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782066558.png" width="100%" alt="Forgot Password" /><br/>
      <sub><b>Forgot Password</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782067769.png" width="100%" alt="OTP Verification" /><br/>
      <sub><b>OTP Code Verification</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782067818.png" width="100%" alt="Reset Password" /><br/>
      <sub><b>Reset Password</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" width="20%">
      <img src="Screenshot_1782067936.png" width="100%" alt="Password Reset Success" /><br/>
      <sub><b>Password Reset Success</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782067762.png" width="100%" alt="OTP Input" /><br/>
      <sub><b>OTP Entry State</b></sub>
    </td>
    <td align="center" width="20%"></td>
    <td align="center" width="20%"></td>
    <td align="center" width="20%"></td>
  </tr>
</table>

### 🏠 Home & Ecosystem Hub
<table>
  <tr>
    <td align="center" width="20%">
      <img src="Screenshot_1781386058.png" width="100%" alt="Home Screen" /><br/>
      <sub><b>Home Dashboard</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782065877.png" width="100%" alt="Smart Workflow" /><br/>
      <sub><b>4-Phase Sequence</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782065889.png" width="100%" alt="Learner Journey" /><br/>
      <sub><b>The Learner Hub</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782065895.png" width="100%" alt="Collaborative Workspace" /><br/>
      <sub><b>The Team Hub</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782065900.png" width="100%" alt="Precision Recruitment" /><br/>
      <sub><b>The Recruiter Hub</b></sub>
    </td>
  </tr>
</table>

### 🧭 Phase 1: Diagnostic Assessment & Track Recommendation
<table>
  <tr>
    <td align="center" width="33.33%">
      <img src="Screenshot_1781386588.png" width="100%" alt="Recommendation Intro" /><br/>
      <sub><b>Recommendation System Intro</b></sub>
    </td>
    <td align="center" width="33.33%">
      <img src="Screenshot_1781386746.png" width="100%" alt="Diagnostic Questions" /><br/>
      <sub><b>10-Question Diagnostic Assessment</b></sub>
    </td>
    <td align="center" width="33.33%">
      <img src="Screenshot_1781386852.png" width="100%" alt="Suggested Track" /><br/>
      <sub><b>Suggested Track & Weekly Hours Slider</b></sub>
    </td>
  </tr>
</table>

### 🗺️ Phase 2: Dynamic Roadmaps & Curated Resources
<table>
  <tr>
    <td align="center" width="25%">
      <img src="Screenshot_1782065920.png" width="100%" alt="Roadmap Light" /><br/>
      <sub><b>Dynamic Roadmap (Light Mode)</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1781815912.png" width="100%" alt="Roadmap Dark" /><br/>
      <sub><b>Dynamic Roadmap (Dark Mode)</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1781815879.png" width="100%" alt="Week Details Dark" /><br/>
      <sub><b>Week Details & Curated Resources</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782075017.png" width="100%" alt="Roadmap Completed" /><br/>
      <sub><b>All 14 Weeks Verified & Unlocked</b></sub>
    </td>
  </tr>
</table>

### 📝 AI Quizzes & Retention Validation
<table>
  <tr>
    <td align="center" width="50%">
      <img src="Screenshot_1782073917.png" width="70%" alt="Quiz Questions" /><br/>
      <sub><b>AI Generated Topic Quiz (MCQ & True/False)</b></sub>
    </td>
    <td align="center" width="50%">
      <img src="Screenshot_1782074473.png" width="70%" alt="Quiz Result" /><br/>
      <sub><b>Quiz Passed (Score 90%) — Next Week Unlocked</b></sub>
    </td>
  </tr>
</table>

### 💻 Phase 3: Project Recommendations & Automated AI Grading
<table>
  <tr>
    <td align="center" width="20%">
      <img src="Screenshot_1782066031.png" width="100%" alt="Capstone Ideas" /><br/>
      <sub><b>Capstone Project Ideas</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782075210.png" width="100%" alt="Project Spec" /><br/>
      <sub><b>Project Specs & Architecture</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782075219.png" width="100%" alt="Submit Project" /><br/>
      <sub><b>Submit Project Submission</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1781549768.png" width="100%" alt="AI Evaluation Strengths" /><br/>
      <sub><b>AI Evaluation: Strengths & Weaknesses</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1781549771.png" width="100%" alt="AI Evaluation Suggestions" /><br/>
      <sub><b>AI Evaluation: Actionable Suggestions</b></sub>
    </td>
  </tr>
</table>

### 👥 Team Workspace & AI Task Decomposition
<table>
  <tr>
    <td align="center" width="25%">
      <img src="Screenshot_1781392123.png" width="100%" alt="Define Team" /><br/>
      <sub><b>1. Define Team Members & Skillsets</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1781392338.png" width="100%" alt="Describe Project" /><br/>
      <sub><b>2. Input Project Requirements</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782076019.png" width="100%" alt="Generated Tasks" /><br/>
      <sub><b>3. AI-Assigned Tasks per Member</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782076027.png" width="100%" alt="Skill Gap" /><br/>
      <sub><b>4. Skill Gap & Unassigned Tasks</b></sub>
    </td>
  </tr>
</table>

### 💼 Phase 4: Recruiter Talent Discovery & Mock Interview Invitations
<table>
  <tr>
    <td align="center" width="25%">
      <img src="Screenshot_1782076239.png" width="100%" alt="Talent Profile" /><br/>
      <sub><b>Completed Track Talent Discovery</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782076296.png" width="100%" alt="Verified Skills" /><br/>
      <sub><b>Verified Skills & Invite Action</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782076276.png" width="100%" alt="Send Invite Modal" /><br/>
      <sub><b>Interview Track Selection Modal</b></sub>
    </td>
    <td align="center" width="25%">
      <img src="Screenshot_1782076283.png" width="100%" alt="Invite Success" /><br/>
      <sub><b>Mock Interview Invite Sent Confirmation</b></sub>
    </td>
  </tr>
</table>

### 👤 User Profiles, Dark Theme & Full Arabic RTL Localization
<table>
  <tr>
    <td align="center" width="20%">
      <img src="Screenshot_1782077182.png" width="100%" alt="Learner Profile" /><br/>
      <sub><b>Learner Profile (Light)</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077187.png" width="100%" alt="Verified Tracks" /><br/>
      <sub><b>Verified Track Badges</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077194.png" width="100%" alt="Skills Acquired" /><br/>
      <sub><b>34 Acquired Skills List</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077261.png" width="100%" alt="Team Profile" /><br/>
      <sub><b>Team Profile</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077127.png" width="100%" alt="Recruiter Profile" /><br/>
      <sub><b>Recruiter Profile</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" width="20%">
      <img src="Screenshot_1782077427.png" width="100%" alt="Arabic Profile RTL" /><br/>
      <sub><b>الملف الشخصي (عربي RTL)</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077431.png" width="100%" alt="Arabic Details RTL" /><br/>
      <sub><b>تفاصيل الحساب (عربي RTL)</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077267.png" width="100%" alt="Team Details" /><br/>
      <sub><b>Team Profile Details</b></sub>
    </td>
    <td align="center" width="20%">
      <img src="Screenshot_1782077142.png" width="100%" alt="Recruiter Details" /><br/>
      <sub><b>Recruiter Profile Details</b></sub>
    </td>
    <td align="center" width="20%"></td>
  </tr>
</table>

---

## 👨‍💻 Author & Acknowledgments

**Developed with ❤️ by Ahmed Moataz (Ahmed Glitch)**

- 🐙 **GitHub**: [@Ahmed-Moataz-glitch](https://github.com/Ahmed-Moataz-glitch)
- 💼 **LinkedIn**: [Ahmed Moataz](https://www.linkedin.com/in/ahmed-moataz-b50a2b252/)
- 📧 **Email**: [Contact via GitHub](https://github.com/Ahmed-Moataz-glitch)

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE.md](LICENSE.md) file for details.
