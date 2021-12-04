import 'package:shared_preferences/shared_preferences.dart';
import 'package:skripsi_raymond/constant.dart';

class Preferences {
  static SharedPreferences? _instance;
  static SharedPreferences? get instance => _instance;

  static init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static bool get isLogin => _instance!.getBool('isLogin') ?? false;
  static int get idUser => _instance!.getInt('idUser') ?? 0;
  static String get email => _instance!.getString('email') ?? '';
  static String get firstName => _instance!.getString('firstName') ?? '';
  static String get lastName => _instance!.getString('lastName') ?? '';
  static String get username => _instance!.getString('username') ?? '';
  static String get noTelp => _instance!.getString('noTelp') ?? '';
  static String get avatar => _instance!.getString('avatar') ?? defaultAvatarMan;
  static String get token => _instance!.getString('token') ?? '';

  static set isLogin(bool value) => _instance!.setBool("isLogin", value);
  static set idUser(int value) => _instance!.setInt("idUser", value);
  static set email(String value) => _instance!.setString("email", value.isNotEmpty ? value : '');
  static set firstName(String value) => _instance!.setString("firstName", value.isNotEmpty ? value : '');
  static set lastName(String value) => _instance!.setString("lastName", value.isNotEmpty ? value : '');
  static set username(String value) => _instance!.setString("username", value.isNotEmpty ? value : '');
  static set noTelp(String value) => _instance!.setString("noTelp", value.isNotEmpty ? value : '');
  static set avatar(String value) => _instance!.setString("avatar", value.isNotEmpty ? value : '');
  static set token(String value) => _instance!.setString("token", value.isNotEmpty ? value : '');

  static void destroy() {
    isLogin = false;
    idUser = 0;
    email = '';
    firstName = '';
    lastName = '';
    token = '';
    avatar = '';
    noTelp = '';
    username = '';
  }
}
