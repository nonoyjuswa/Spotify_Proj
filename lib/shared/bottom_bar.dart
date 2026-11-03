import 'package:flutter/material.dart';
import 'mini_player.dart';

// Remembers which tab is selected, shared by all screens
final ValueNotifier<int> selectedTab = ValueNotifier(0);

class BottomBar extends StatelessWidget {
  final bool isShell; // true only when used inside MainShell
  const BottomBar({super.key, this.isShell = false});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedTab,
      builder: (context, index, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MiniPlayer(),
            BottomNavigationBar(
              backgroundColor: Color(0xFF181818),
              currentIndex: index,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              onTap: (i) {
                selectedTab.value = i;
                if (!isShell) {
                  // pushed screen: go back to MainShell
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.library_music), label: "Library"),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
              ],
            ),
          ],
        );
      },
    );
  }
}