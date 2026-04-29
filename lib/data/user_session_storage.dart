import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  const UserSession({required this.id, required this.name});

  final String id;
  final String name;
}

class UserSessionStorage {
  UserSessionStorage._();

  static const _kName = 'drunk_test.user.name';
  static const _kId = 'drunk_test.user.id';

  static Future<UserSession?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_kName);
    final id = prefs.getString(_kId);
    if (name == null || name.isEmpty || id == null || id.isEmpty) {
      return null;
    }
    return UserSession(id: id, name: name);
  }

  static Future<void> save(UserSession session) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kName, session.name);
    await prefs.setString(_kId, session.id);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kName);
    await prefs.remove(_kId);
  }
}
