import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _currentUser != null;
  bool get isAdmin => _currentUser?.role == UserRole.admin;

  AuthService() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('user');
    if (userStr != null) {
      _currentUser = UserModel.fromJson(jsonDecode(userStr));
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Mock delay
    await Future.delayed(const Duration(seconds: 1));

    // Basic Mock logic
    if (email == 'admin@evently.com' && password == 'admin123') {
      _currentUser = UserModel(
        id: '1',
        name: 'Admin User',
        email: email,
        role: UserRole.admin,
      );
    } else if (email.isNotEmpty && password.length >= 6) {
      _currentUser = UserModel(
        id: '2',
        name: 'Normal User',
        email: email,
        role: UserRole.user,
      );
    } else {
      _isLoading = false;
      notifyListeners();
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(_currentUser!.toJson()));
    
    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _currentUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      role: UserRole.user,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(_currentUser!.toJson()));

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
  }
}
