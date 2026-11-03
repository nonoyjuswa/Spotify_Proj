import 'package:flutter/material.dart';
import 'search.dart';
import 'app_drawer.dart';
import 'profile_avatar.dart';
import 'constants.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainShell(),
  ));
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0; // 0 = Home (default)

  @override
  Widget build(BuildContext context) {
    final pages = [
      SpotifyHome(),
      SearchPage(),
      Center(child: Text('Library', style: TextStyle(color: Colors.white))),
      Center(child: Text('Create', style: TextStyle(color: Colors.white))),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF121212),

      drawer: AppDrawer(),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF181818),
        currentIndex: currentIndex, // highlights the active tab
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
        ],
      ),
    );
  }
}

class SpotifyHome extends StatelessWidget {
  const SpotifyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kPagePadding),
            child: Column(
              children: [

                // TOP PROFILE AND CATEGORIES
                Row(
                  children: [
                    ProfileAvatar(),
                    SizedBox(width: 10),
                    category("All"),
                    category("Music"),
                    category("Podcasts"),
                  ],
                ),

                SizedBox(height: 20),

                // RECENTLY PLAYED
                Row(
                  children: [
                    playlist("Liked Songs"),
                    playlist("Chill Hits"),
                  ],
                ),

                Row(
                  children: [
                    playlist("Daily Mix"),
                    playlist("Pop Music"),
                  ],
                ),

                SizedBox(height: 15),

                // MADE FOR YOU
                Row(
                  children: [
                    album("Discover Weekly"),
                    album("Release Radar"),
                    album("Daily Mix"),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    album("Chill Music"),
                    album("Top Hits"),
                    album("Favorites"),
                  ],
                ),

                SizedBox(height: 20),

                // MUSIC CATEGORIES
                Row(
                  children: [
                    smallCard(),
                    smallCard(),
                    smallCard(),
                    smallCard(),
                  ],
                ),

                SizedBox(height: 20),

                // FEATURED PLAYLIST
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF282828),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Featured Playlist",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
    );
  }

  // CATEGORY BUTTON
  Widget category(String name) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF282828),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  // RECENT PLAYLIST
  Widget playlist(String name) {
    return Expanded(
      child: Container(
        height: 55,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color(0xFF282828),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 55,
              color: Colors.green,
              child: Icon(Icons.music_note, color: Colors.white),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ALBUM CARD
  Widget album(String name) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.album,
                  color: Colors.green,
                  size: 35,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  // SMALL MUSIC CARD
  Widget smallCard() {
    return Expanded(
      child: Container(
        height: 40,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color(0xFF333333),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.music_note,
          color: Colors.green,
          size: 20,
        ),
      ),
    );
  }
}
