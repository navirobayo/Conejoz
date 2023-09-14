import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/constants/offline_themes/flutter_atari_theme.dart';
import 'package:conejoz/src/constants/offline_themes/flutter_monokai_theme.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ThemeManager {
  static final ThemeManager instance = ThemeManager._internal();

  factory ThemeManager() {
    return instance;
  }

  ThemeManager._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ThemeData get defaultTheme => FlutterAtariTheme.lightTheme;

  Future<ThemeData> getTheme() async {
    final user = _firestore
        .collection('users')
        .doc('user_id'); // Replace 'user_id' with the actual user ID
    final userData = await user.get();
    final appTheme = userData.get('apptheme') ?? 'default';
    return _getThemeByName(appTheme).item1;
  }

  Tuple2<ThemeData, ThemeData> _getThemeByName(String themeName) {
    if (themeName == 'Atari') {
      return Tuple2(FlutterAtariTheme.lightTheme, FlutterAtariTheme.darkTheme);
    } else if (themeName == 'Monokai') {
      return Tuple2(
          FlutterMonokaiTheme.lightTheme, FlutterMonokaiTheme.darkTheme);
    } else {
      return Tuple2(FlutterAtariTheme.lightTheme, FlutterAtariTheme.darkTheme);
    }
  }
}
