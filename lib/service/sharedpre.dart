import 'package:shared_preferences/shared_preferences.dart';

bool loingbool  = false;
Future<bool> isLogin(String api) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  if (api == '') {
   return loingbool = await pref.setBool('isLogin', false);
  } else {
   return loingbool =  await pref.setBool('isLogin', true);
  }
}
