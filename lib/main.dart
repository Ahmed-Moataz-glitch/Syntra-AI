// ignore_for_file: dead_code, unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_theme.dart';
import 'package:syntra_ai/core/utils/secure_storage.dart';
import 'package:syntra_ai/core/view/pages/onboarding_page.dart';
import 'package:syntra_ai/core/view/widgets/app_section.dart';
import 'package:syntra_ai/core/view_model/language_cubit/language_cubit.dart';
import 'package:syntra_ai/core/view_model/theme_cubit/theme_cubit.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/login_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/register_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/reset_password_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/successful_reset_password_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/verify_code_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/verify_email_page.dart';
import 'package:syntra_ai/features/community/presentation/view/pages/community_page.dart';
import 'package:syntra_ai/features/home/presentation/view/pages/home_page.dart';
import 'package:syntra_ai/features/home/presentation/view/pages/roles_page.dart';
import 'package:syntra_ai/features/home/presentation/view/pages/work_flow_page.dart';
import 'package:syntra_ai/features/learn/data/model/user_roadmap_model.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/learn_page_for_learner.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/learning_project_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/questions_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/roadmap_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/suggested_track_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/week_quiz_page.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';
import 'package:syntra_ai/features/profile/presentation/view/pages/profile_page.dart';
import 'package:syntra_ai/firebase_options.dart';
import 'package:syntra_ai/generated/l10n.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserProfileModelAdapter());
  Hive.registerAdapter(UserRoadmapModelAdapter());
  Hive.registerAdapter(RoadmapModelAdapter());
  Hive.registerAdapter(SkillsModelAdapter());
  Hive.registerAdapter(ResourcesModelAdapter());
  await Hive.openBox<UserProfileModel>(AppApi.userProfileBox);
  await Hive.openBox<UserRoadmapModel>(AppApi.userRoadmapBox);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseCrashlytics.instance.crash();
  await Supabase.initialize(
    url: 'https://saqubrtvznqhcptwkhze.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNhcXVicnR2em5xaGNwdHdraHplIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ5MDE3NDEsImV4cCI6MjA5MDQ3Nzc0MX0.h9vjjnjdcz41WcJ-eE94rHZmRIZmEcEPCUqvV9q-Rgs',
  );
  await handleNotification();
  final token = await SecureStorage.getToken();
  runApp(MyApp(token: token));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

Future<void> handleNotification() async {
  // Handling background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Taking permission
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  debugPrint('User granted permission: ${settings.authorizationStatus}');
  // Handling foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      String title = message.notification!.title ?? '';
      String body = message.notification!.body ?? '';
      debugPrint('Message also contained a notification: Title: $title');
      debugPrint('Message also contained a notification: Body: $body');

      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(navigatorKey.currentContext!).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('A new onMessageOpenedApp event was published!');
    debugPrint('Message data: ${message.data}');
    // final messageData = message.data;
    // if (messageData['task_title'] != null) {
    // Navigator.of(navigatorKey.currentContext!).pushNamed(
    //   AppRoutes.homePage,
    // );
    // }
    Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoutes.appSection);
  });
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 869),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
            ),
            BlocProvider<LanguageCubit>(
              create: (context) => LanguageCubit(),
            ),
          ],
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final languageCubit = LanguageCubit.get(context);
              return BlocBuilder<ThemeCubit, ThemeState>(
                // bloc: AppCubit.get(context),
                builder: (context, state) {
                  final themeCubit = ThemeCubit.get(context);
                  return MaterialApp(
                    builder: (context, child) {
                      return OfflineBuilder(
                        child: child!,
                        connectivityBuilder: (context, connectivity, child) {
                          final connected =
                              !connectivity.contains(ConnectivityResult.none);
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              child,
                              if (!connected)
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Material(
                                    color: AppColors.red.withAlpha(220),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.r),
                                      child: Text(
                                        'No internet connection',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                    locale: Locale(languageCubit.getLanguage()),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    title: AppApi.appName,
                    navigatorKey: navigatorKey,
                    theme: AppTheme.light,
                    darkTheme: AppTheme.dark,
                    themeMode: themeCubit.getTheme(),
                    onGenerateInitialRoutes: (initialRoute) {
                      if (token != null) {
                        return [
                          MaterialPageRoute(
                              builder: (context) => const AppSection()),
                        ];
                      } else {
                        return [
                          MaterialPageRoute(
                              builder: (context) => const OnboardingPage()),
                        ];
                      }
                    },
                    onGenerateRoute: (settings) {
                      switch (settings.name) {
                        case AppRoutes.onboarding:
                          return MaterialPageRoute(
                            builder: (context) => const OnboardingPage(),
                          );
                        case AppRoutes.register:
                          return MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          );
                        case AppRoutes.login:
                          return MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          );
                        case AppRoutes.verifyEmail:
                          final email = settings.arguments as String?;
                          return MaterialPageRoute(
                            builder: (context) => VerifyEmailPage(email: email),
                          );
                        case AppRoutes.forgetPassword:
                          return MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          );
                        case AppRoutes.verifyCode:
                          final email = settings.arguments as String?;
                          return MaterialPageRoute(
                            builder: (context) => VerifyCodePage(email: email),
                          );
                        case AppRoutes.resetPassword:
                          final args = settings.arguments as Map<String, dynamic>;
                          final email = args['email'] as String;
                          final otp = args['otp'] as String;
                          return MaterialPageRoute(
                            builder: (context) => ResetPasswordPage(
                              email: email,
                              otp: otp,
                            ),
                          );
                        case AppRoutes.successfulResetPassword:
                          return MaterialPageRoute(
                            builder: (context) =>
                                const SuccessfulResetPasswordPage(),
                          );
                        case AppRoutes.appSection:
                          return MaterialPageRoute(
                            builder: (context) => const AppSection(),
                          );
                        case AppRoutes.workFlow:
                          return MaterialPageRoute(
                            builder: (context) => const WorkFlowPage(),
                          );
                        case AppRoutes.roles:
                          return MaterialPageRoute(
                            builder: (context) => const RolesPage(),
                          );
                        case AppRoutes.questions:
                          final learnCubit = settings.arguments as LearnCubit;
                          return MaterialPageRoute(
                            builder: (context) =>
                                QuestionsPage(learnCubit: learnCubit),
                          );
                        case AppRoutes.suggestedTrack:
                          final args =
                              settings.arguments as Map<String, dynamic>;
                          final learnCubit = args['learnCubit'] as LearnCubit;
                          final suggestedTrack =
                              args['suggestedTrack'] as String;
                          return MaterialPageRoute(
                            builder: (context) => SuggestedTrackPage(
                                learnCubit: learnCubit,
                                suggestedTrack: suggestedTrack),
                          );
                        case AppRoutes.roadmap:
                          final args =
                              settings.arguments as Map<String, dynamic>;
                          final learnCubit = args['learnCubit'] as LearnCubit;
                          final generateRoadmapResponseEntity =
                              args['generateRoadmapResponseEntity']
                                  as GenerateRoadmapResponseEntity;                          return MaterialPageRoute(
                            builder: (context) => RoadmapPage(
                              learnCubit: learnCubit,
                              generateRoadmapResponseEntity:
                                  generateRoadmapResponseEntity,
                            ),
                          );
                        case AppRoutes.learningProject:
                          final args =
                              settings.arguments as Map<String, dynamic>;
                          final learnCubit = args['learnCubit'] as LearnCubit;
                          final generateRoadmapResponseEntity =
                              args['generateRoadmapResponseEntity']
                                  as GenerateRoadmapResponseEntity;
                          return MaterialPageRoute(
                            builder: (context) => LearningProjectPage(
                              learnCubit: learnCubit,
                              generateRoadmapResponseEntity:
                                  generateRoadmapResponseEntity,
                            ),
                          );
                        case AppRoutes.weekQuiz:
                          final generateRoadmapResponseEntity = settings
                              .arguments as GenerateRoadmapResponseEntity;
                          return MaterialPageRoute(
                            builder: (context) => WeekQuizPage(
                                generateRoadmapResponseEntity:
                                    generateRoadmapResponseEntity),
                          );
                        default:
                          return null;
                      }
                    },
                    onUnknownRoute: (settings) {
                      switch (settings.name) {
                        case AppRoutes.home:
                          return MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          );
                        case AppRoutes.learn:
                          return MaterialPageRoute(
                            builder: (context) => const LearnPageForLearner(),
                          );
                        case AppRoutes.community:
                          return MaterialPageRoute(
                            builder: (context) => const CommunityPage(),
                          );
                        case AppRoutes.profile:
                          return MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          );
                        default:
                          return null;
                      }
                    },
                    // initialRoute:  token != null ? AppRoutes.appSection : AppRoutes.onboarding,
                    // routes: {
                    //   AppRoutes.onboarding: (context) => const OnboardingPage(),
                    //   AppRoutes.login: (context) => const LoginPage(),
                    //   AppRoutes.register: (context) => const RegisterPage(),
                    //   AppRoutes.appSection: (context) => const AppSection(),
                    //   // AppRoutes.home: (context) => const HomePage(),
                    //   AppRoutes.forgetPassword: (context) => const ForgetPasswordPage(),
                    //   AppRoutes.verifyEmail: (context) => const VerifyEmailPage(),
                    //   AppRoutes.verifyCode: (context) => const VerifyCodePage(),
                    //   AppRoutes.resetPassword: (context) => const ResetPasswordPage(),
                    //   AppRoutes.successfulResetPassword: (context) =>
                    //       const SuccessfulResetPasswordPage(),
                    // },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
