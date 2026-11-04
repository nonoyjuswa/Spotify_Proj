import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LibraryPage(),
    );
  }
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Header
                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(
                          children: [
                            const Text(
                              'Your Library',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Filter buttons
                      Row(
                        children: [
                          ChoiceChip(
                            label: const Text('Playlists'),
                            selected: selectedFilter == 0,
                            onSelected: (value) {
                              setState(() {
                                selectedFilter = 0;
                              });
                            },
                            selectedColor: const Color(0xFF1DB954),
                            backgroundColor: const Color(0xFF282828),
                            labelStyle: TextStyle(
                              color: selectedFilter == 0
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text('Artists'),
                            selected: selectedFilter == 1,
                            onSelected: (value) {
                              setState(() {
                                selectedFilter = 1;
                              });
                            },
                            selectedColor: const Color(0xFF1DB954),
                            backgroundColor: const Color(0xFF282828),
                            labelStyle: TextStyle(
                              color: selectedFilter == 1
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(width: 8),

                          ChoiceChip(
                            label: const Text('Albums'),
                            selected: selectedFilter == 2,
                            onSelected: (value) {
                              setState(() {
                                selectedFilter = 2;
                              });
                            },
                            selectedColor: const Color(0xFF1DB954),
                            backgroundColor: const Color(0xFF282828),
                            labelStyle: TextStyle(
                              color: selectedFilter == 2
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      // Sorting
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 19,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Recently played',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),

                      // Playlist grid
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2.8,
                        children: [

                          // Liked Songs
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF292929),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  color: const Color(0xFF514475),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Liked Songs',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Daily Mix
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF292929),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  color: const Color(0xFF385B43),
                                  child: const Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Daily Mix 1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Chill Hits
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF292929),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  color: const Color(0xFF754F42),
                                  child: const Icon(
                                    Icons.sunny,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Chill Hits',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Discover Weekly
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF292929),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  color: const Color(0xFF253F59),
                                  child: const Icon(
                                    Icons.headphones,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Discover Weekly',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Your playlists heading
                      Container(
                        padding: const EdgeInsets.only(top: 25, bottom: 14),
                        child: const Text(
                          'Your playlists',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      // Playlist 1
                      Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              color: const Color(0xFF514475),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Liked Songs',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Playlist • 226 songs',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Playlist 2
                      Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              color: const Color(0xFF385B43),
                              child: const Icon(
                                Icons.music_note,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Favorites',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Playlist • 42 songs',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Playlist 3
                      Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              color: const Color(0xFF76523F),
                              child: const Icon(
                                Icons.nightlight_round,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Late Night Vibes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Playlist • 31 songs',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Playlist 4
                      Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              color: const Color(0xFF34536B),
                              child: const Icon(
                                Icons.headphones,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily Mix 1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Made for you',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Recently played artists
                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: const Text(
                          'Recently played artists',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      // Artists row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF514475),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Jack Harlow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF385B43),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Kid Cudi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF76523F),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Artist Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      
      // Bottom Music Player and Navigation
      bottomNavigationBar: Container(
        color: const Color(0xFF121212),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Mini Music Player
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: const Color(0xFF806F27),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [

                  // Album Cover
                  Container(
                    width: 47,
                    height: 47,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Song Details
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KYRIE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          '+ KTDF Choir',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.devices_outlined,
                    color: Colors.white,
                    size: 26,
                  ),

                  const SizedBox(width: 18),

                  const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 27,
                  ),

                  const SizedBox(width: 18),

                  const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),

            // Bottom Navigation
            BottomNavigationBar(
              backgroundColor: const Color(0xFF121212),
              currentIndex: 2,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: const [

                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  label: 'Your Library',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: 'Premium',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Create',
                ),
              ],
            ),
          ],
        ),
      ),
          );
  }
}
