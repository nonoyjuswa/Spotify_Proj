import 'package:flutter/material.dart';
import 'addAccount.dart';
import 'premium.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SpotifyHome(),
  ));
}

class SpotifyHome extends StatelessWidget {
  const SpotifyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),

      drawer: Drawer(
        backgroundColor: Color(0xFF181818),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Nonoy',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.white),
              title: Text('Add account', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // close drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddAccountPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium, color: Colors.white),
              title: Text('Premium', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PremiumPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [

                // TOP PROFILE AND CATEGORIES
                Row(
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ),
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
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF181818),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // CATEGORY BUTTON
  Widget category(String name) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF282828),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
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
