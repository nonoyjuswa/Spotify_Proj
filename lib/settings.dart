import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool dataSaver = true;
  bool privateSession = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: Column(
          children: [

            // Header
            Container(
              color: const Color(0xFF262626),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),

                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),

            // Settings content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [

                      // Account type
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 35,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Free account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 42),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 13,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                'Go Premium',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Data Saver and Private Session
                      Row(
                        children: [

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  dataSaver = !dataSaver;
                                });
                              },
                              child: Container(
                                height: 105,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF292929),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.bar_chart,
                                      color: Colors.white,
                                      size: 35,
                                    ),

                                    const SizedBox(height: 7),

                                    const Text(
                                      'Data saver mode',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),

                                    const SizedBox(height: 3),

                                    Text(
                                      dataSaver ? 'Automatic' : 'Off',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  privateSession = !privateSession;
                                });
                              },
                              child: Container(
                                height: 105,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF292929),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      privateSession
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                      size: 35,
                                    ),

                                    const SizedBox(height: 7),

                                    const Text(
                                      'Private session',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),

                                    const SizedBox(height: 3),

                                    Text(
                                      privateSession ? 'On' : 'Off',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Account
                      settingItem(
                        Icons.account_circle_outlined,
                        'Account',
                        'Username • Close account',
                      ),

                      // Content and display
                      settingItem(
                        Icons.music_note,
                        'Content and display',
                        'Canvas • Allow explicit content',
                      ),

                      // Privacy and social
                      settingItem(
                        Icons.lock_outline,
                        'Privacy and social',
                        'Private session • Public playlists',
                      ),

                      // Playback
                      settingItem(
                        Icons.volume_up_outlined,
                        'Playback',
                        'Gapless playback • Autoplay',
                      ),

                      // Notifications
                      settingItem(
                        Icons.notifications_none,
                        'Notifications',
                        'Push • Email',
                      ),

                      // Apps and devices
                      settingItem(
                        Icons.devices_outlined,
                        'Apps and devices',
                        'Connect to a device',
                      ),

                      // Data saving
                      settingItem(
                        Icons.download_outlined,
                        'Data saving and offline',
                        'Data saver mode • Downloads over cellular',
                      ),

                      // Audio quality
                      settingItem(
                        Icons.equalizer,
                        'Media quality',
                        'Wi-Fi streaming quality • Audio download quality',
                      ),

                      // About
                      settingItem(
                        Icons.info_outline,
                        'About',
                        'Version • Privacy policy',
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

      // Bottom player and navigation
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

                  // Album cover
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

                  // Song details
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

  // Settings item layout
  Widget settingItem(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Row(
        children: [

          // Icon
          SizedBox(
            width: 43,
            child: Icon(
              icon,
              color: Colors.white,
              size: 33,
            ),
          ),

          const SizedBox(width: 8),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
