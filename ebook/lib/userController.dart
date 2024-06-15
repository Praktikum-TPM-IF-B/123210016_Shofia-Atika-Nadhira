import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/user.dart';

class UserController {
  static Future<void> addUser(String name, String username, String password) async {
    var userBox = await Hive.openBox<User>('users');
    User newUser = User(name: name, username: username, password: password);
    await userBox.add(newUser);
  }

  static Future<User?> getUser(String username, String password) async {
    var userBox = await Hive.openBox<User>('users');
    try {
      return userBox.values.firstWhere(
        (user) => user.username == username && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isUsernameUnique(String username) async {
    var userBox = await Hive.openBox<User>('users');
    return !userBox.values.any((user) => user.username == username);
  }

  static Future<void> printAllUsers() async {
  var userBox = await Hive.openBox<User>('users');
  print("Total Users: ${userBox.length}");
  for (var user in userBox.values) {
    print("Name: ${user.name}, Username: ${user.username}, Password: ${user.password}");
  }
}
}
