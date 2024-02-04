import 'package:flutter/material.dart';
import 'package:fma/screens/home/pages/home_page.dart';
import 'package:fma/screens/home/pages/library_page.dart';
import 'package:fma/screens/home/pages/search_page.dart';

enum Pages { home, search, library }

extension PagesExtension on Pages {
  BottomNavigationBarItem toBottomNavigationBarItem() {
    switch (this) {
      case Pages.home:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Home");
      case Pages.search:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.search), label: "Search");
      case Pages.library:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.library_music), label: "Library");
    }
  }

  Widget state() {
    switch (this) {
      case Pages.home:
        return const HomePage();
      case Pages.search:
        return const SearchPage();
      case Pages.library:
        return const LibraryPage();
    }
  }
}
