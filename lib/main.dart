import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'library.dart';
import 'shared/app_drawer.dart';
import 'shared/bottom_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainShell(),
  ));
}

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      SpotifyHome(),
      SearchPage(),
      LibraryPage(),
      Center(child: Text('Create', style: TextStyle(color: Colors.white))),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF121212),
      drawer: AppDrawer(),
      body: ValueListenableBuilder<int>(
        valueListenable: selectedTab,
        builder: (context, index, _) => pages[index],
      ),
      bottomNavigationBar: BottomBar(isShell: true),
    );
  }
}