import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/share_prefs/user_preferences_shared.dart';
 
void main()async { 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =  new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
  }
 
class MyApp extends StatelessWidget {

  final prefs =  new UserPreferences();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage() 
      },
    );
  }
}
// WidgetsFlutterBinding.ensureInitialized();
