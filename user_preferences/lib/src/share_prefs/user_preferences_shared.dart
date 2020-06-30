import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/pages/home_page.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get gender{
    return _prefs.getInt('gender')?? 1;
  }

  set gender(int val){
     _prefs.setInt('gender', val);
  }
  get secondaryColor{
    return _prefs.getBool('secondaryColor')?? false;
  }

  set secondaryColor(bool val){
     _prefs.setBool('secondaryColor', val);
  }
  get name{
    return _prefs.getString('name')?? 'Name';
  }

  set name(String val){
     _prefs.setString('name', val);
  }

  get lastPage{
    return _prefs.getString('lastPage')?? HomePage.routeName;
  }

  set lastPage(String val){
     _prefs.setString('lastPage', val);
  }


  // bool _secondaryColor;
  // int _gender;
  // String _name;
}
