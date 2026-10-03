import 'package:shared_preferences/shared_preferences.dart';

/// مفاتيح التخزين في مكان واحد عشان نتجنب أخطاء الكتابة.
class CacheKeys {
  CacheKeys._();

  static const String onBoarding = 'onBoarding';
  static const String token = 'token';
  static const String isDarkMode = 'isDarkMode';
  static const String language = 'language';
}

class CacheHelper {
  CacheHelper._();

  static late SharedPreferences _prefs;

  /// لازم تتنده مرة واحدة في main() قبل runApp
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// بتحفظ أي نوع مدعوم: String, int, double, bool, List <string
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) {
    if (value is String) return _prefs.setString(key, value);
    if (value is bool) return _prefs.setBool(key, value);
    if (value is int) return _prefs.setInt(key, value);
    if (value is double) return _prefs.setDouble(key, value);
    if (value is List<String>) return _prefs.setStringList(key, value);
    throw ArgumentError('Unsupported type: ${value.runtimeType}');
  }

  /// مثال: CacheHelper.getData<String (key: CacheKeys.token)
  static T? getData<T>({required String key}) {
    final value = _prefs.get(key);
    return value is T ? value : null;
  }

  static List<String>? getStringList({required String key}) =>
      _prefs.getStringList(key);

  static bool containsKey(String key) => _prefs.containsKey(key);

  static Future<bool> removeData({required String key}) => _prefs.remove(key);

  /// بتمسح كل حاجة (مثلًا عند تسجيل الخروج)
  static Future<bool> clearAll() => _prefs.clear();
}
