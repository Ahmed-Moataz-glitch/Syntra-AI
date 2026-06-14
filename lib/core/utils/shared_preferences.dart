import 'package:shared_preferences/shared_preferences.dart';
import 'package:syntra_ai/core/view_model/language_cubit/language_cubit.dart';
import 'package:syntra_ai/core/view_model/theme_cubit/theme_cubit.dart';

class FlutterSharedPreferences {
  FlutterSharedPreferences._();
  static final FlutterSharedPreferences instance = FlutterSharedPreferences._();
  static final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  final themeModeKey = 'themeMode';
  final languageKey = 'language';
  final studentIdKey = 'studentId';
  final roleKey = 'role';

  Future<SharedPreferences> get() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveThemeMode(ThemeModeState themeMode) async {
    final prefs = await _sharedPreferences;
    prefs.setString(themeModeKey, themeMode.toString());
  }

  Future<ThemeModeState> getThemeMode() async {
    final prefs = await _sharedPreferences;
    final themeMode = prefs.getString(themeModeKey);
    if (themeMode != null) {
      return ThemeModeState.values.firstWhere(
        (e) => e.toString() == themeMode,
        orElse: () => ThemeModeState.system,
      );
    }
    return ThemeModeState.system;
  }

  Future<void> removeThemeMode() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(themeModeKey);
  }

  Future<void> saveLanguage(String language) async {
    final prefs = await _sharedPreferences;
    prefs.setString(languageKey, language);
  }

  Future<LanguageModeState> getLanguage() async {
    final prefs = await _sharedPreferences;
    final language = prefs.getString(languageKey);
    if (language != null) {
      return LanguageModeState.values.firstWhere(
        (e) => e.toString() == language,
        orElse: () => LanguageModeState.english,
      );
    }
    return LanguageModeState.english;
  }

  Future<void> removeLanguage() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(languageKey);
  }

  Future<void> saveRole(String role) async {
    final prefs = await _sharedPreferences;
    prefs.setString(roleKey, role);
  }

  Future<String> getRole() async {
    final prefs = await _sharedPreferences;
    return prefs.getString(roleKey) ?? '';
  }

  Future<void> removeRole() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(roleKey);
  }

  Future<void> saveStudentId(String studentId) async {
    final prefs = await _sharedPreferences;
    prefs.setString(studentIdKey, studentId);
  }

  Future<String> getStudentId() async {
    final prefs = await _sharedPreferences;
    return prefs.getString(studentIdKey) ?? '';
  }

  Future<void> removeStudentId() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(studentIdKey);
  }
}
