import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider untuk menyimpan index tab yang aktif pada NavigationBar.
/// Menggantikan [_selectedIndex] + setState di MainPage.
final selectedNavIndexProvider = StateProvider<int>((ref) => 0);
