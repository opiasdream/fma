import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: add hive user data service. // HiveUserDataService().getTheme() ??
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
