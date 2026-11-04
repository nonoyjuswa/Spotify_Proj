import 'package:flutter/material.dart';
import 'shared/profile_avatar.dart';
import 'shared/bottom_bar.dart';
import 'shared/constants.dart';
import 'shared/app_drawer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const SpotifyStatsPage(),
    );
  }
}

class SpotifyStatsPage extends StatefulWidget {
  const SpotifyStatsPage({super.key});

  @override
  State<SpotifyStatsPage> createState() => _SpotifyStatsPageState();
}

class _SpotifyStatsPageState extends State<SpotifyStatsPage> {
  int selectedTimeframe = 0; // 0: 4 Weeks, 1: 6 Months, 2: Lifetime

  final List<String> timeframes = const ['4 Weeks', '6 Months', 'Lifetime'];

  // Mock Top Artists Data
  final List<Map<String, dynamic>> topArtists = const [
    {'name': 'Jack Harlow', 'hours': '42 hrs', 'color': Color(0xFF514475)},
    {'name': 'Kid Cudi', 'hours': '38 hrs', 'color': Color(0xFF385B43)},
    {'name': 'Drake', 'hours': '29 hrs', 'color': Color(0xFF76523F)},
    {'name': 'Kanye West', 'hours': '21 hrs', 'color': Color(0xFF34536B)},
  ];

  // Mock Top Tracks Data
  final List<Map<String, String>> topTracks = const [
    {
      'title': 'First Class',
      'artist': 'Jack Harlow',
      'plays': '142 plays',
      'albumColor': '0xFF514475'
    },
    {
      'title': 'Day \'N\' Nite',
      'artist': 'Kid Cudi',
      'plays': '118 plays',
      'albumColor': '0xFF385B43'
    },
    {
      'title': 'KYRIE',
      'artist': 'KTDF Choir',
      'plays': '95 plays',
      'albumColor': '0xFF806F27'
    },
    {
      'title': 'God\'s Plan',
      'artist': 'Drake',
      'plays': '84 plays',
      'albumColor': '0xFF34536B'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      bottomNavigationBar: BottomBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.fromLTRB(kPagePadding, 16, kPagePadding, 12),
              child: Row(
                children: [
                  ProfileAvatar(),
                  const SizedBox(width: 12),
                  const Text(
                    'Listening Stats',
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
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                      
                      // Timeframe Selection Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(timeframes.length, (index) {
                            final isSelected = selectedTimeframe == index;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(timeframes[index]),
                                selected: isSelected,
                                onSelected: (_) {
                                  setState(() => selectedTimeframe = index);
                                },
                                selectedColor: const Color(0xFF1DB954),
                                backgroundColor: const Color(0xFF282828),
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelStyle: TextStyle(
                                  color: isSelected ? Colors.black : Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Metric Summary Cards
                      Row(
                        children: [
                          Expanded(
                            child: _buildMetricCard(
                              title: 'Minutes Listened',
                              value: '18,420',
                              subtitle: 'Top 5% worldwide',
                              icon: Icons.equalizer,
                              accentColor: const Color(0xFF1DB954),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildMetricCard(
                              title: 'Top Genre',
                              value: 'Hip-Hop',
                              subtitle: '42% of streams',
                              icon: Icons.category,
                              accentColor: const Color(0xFFBB86FC),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Top Artists Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top Artists',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Top Artists Horizontal Scroll
                      SizedBox(
                        height: 130,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: topArtists.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 14),
                          itemBuilder: (context, index) {
                            final artist = topArtists[index];
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 76,
                                      height: 76,
                                      decoration: BoxDecoration(
                                        color: artist['color'] as Color,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.person,
                                        size: 38,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF1DB954),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '#${index + 1}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  artist['name'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  artist['hours'] as String,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Top Tracks Section
                      const Text(
                        'Top Tracks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),

                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: topTracks.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final track = topTracks[index];
                          final colorVal = int.parse(track['albumColor']!);
                          return Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: index == 0
                                        ? const Color(0xFF1DB954)
                                        : Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(colorVal),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.music_note,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      track['title']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      track['artist']!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                track['plays']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // Genre Breakdown Section
                      const Text(
                        'Genre Distribution',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 14),

                      _buildGenreBar('Hip-Hop / Rap', 0.42, const Color(0xFF1DB954)),
                      _buildGenreBar('Pop & Dance', 0.28, const Color(0xFF385B43)),
                      _buildGenreBar('R&B / Soul', 0.18, const Color(0xFF514475)),
                      _buildGenreBar('Indie Rock', 0.12, const Color(0xFF76523F)),

                      const SizedBox(height: 24),
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

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(icon, color: accentColor, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: accentColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreBar(String genre, double percentage, Color barColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                genre,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${(percentage * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 6,
              backgroundColor: const Color(0xFF282828),
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
        ],
      ),
    );
  }
}