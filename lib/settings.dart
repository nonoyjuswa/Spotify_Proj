import 'package:flutter/material.dart';
import 'shared/bottom_bar.dart';

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
      bottomNavigationBar: BottomBar(),
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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
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
