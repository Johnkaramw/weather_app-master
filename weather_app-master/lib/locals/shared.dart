import 'package:shared_preferences/shared_preferences.dart';


class Shared{

 static late  SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // String , bool , int , double

static putString({required String key, required String value}){
    sharedPreferences.setString(key, value);
}
  static getString({required String key}){
   return sharedPreferences.getString(key)?? " ";
}
  static putvar({required String key, required var value}){
    sharedPreferences.noSuchMethod(value);
  }
  static getvar({required String key}){
    return sharedPreferences.get(key);
  }

  static putBOOL({required String key, required bool value}){
    sharedPreferences.setBool(key, value);
}
  static getBOOL({required String key}){
    return sharedPreferences.getBool(key) ?? false;
}

 static putInt({required String key, required int value}){
    sharedPreferences.setInt(key, value);
}
 static getInt({required String key}){
    return sharedPreferences.getInt(key) ?? 0;
}
 static putDouble({required String key, required double value}){
    sharedPreferences.setDouble(key, value);
}
 static getDouble({required String key}){
    return sharedPreferences.getDouble(key)?? 0.0;
}

static putList({required String key, required List<String> value}){
    sharedPreferences.setStringList(key, value);
}

static getList({required String key}){
  return sharedPreferences.getStringList(key);
}

deleteData(){
    sharedPreferences.clear();
}
removeData({key}){
    sharedPreferences.remove(key);
}


}