import 'package:flutter/material.dart';
import 'shared/profile_avatar.dart';
import 'shared/constants.dart';

class SpotifyHome extends StatelessWidget {
  const SpotifyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // STICKY HEADER
          Padding(
            padding: EdgeInsets.all(kPagePadding),
            child: Row(
              children: [
                ProfileAvatar(),
                SizedBox(width: 10),
                category("All"),
                category("Music"),
                category("Podcasts"),
              ],
            ),
          ),

          // SCROLLING CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(kPagePadding, 0, kPagePadding, kPagePadding),
              child: Column(
                children: [
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                child: Icon(Icons.album, color: Colors.green, size: 35),
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

  Widget smallCard() {
    return Expanded(
      child: Container(
        height: 40,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color(0xFF333333),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(Icons.music_note, color: Colors.green, size: 20),
      ),
    );
  }
}