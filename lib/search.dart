import 'package:flutter/material.dart';
import 'profile_avatar.dart';
import 'constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const List<_Category> _topCategories = [
    _Category('Music', Color(0xFFDC148C)),
    _Category('Podcasts', Color(0xFF006450)),
    _Category('Live Events', Color(0xFF8400E7)),
    _Category('K-Pop ON! (온)\nHub', Color(0xFF2D46B9)),
    _Category('Made For You', Color(0xFF8D67AB)),
  ];

  static const List<_Category> _moreCategories = [
    _Category('Upcoming\nreleases', Color(0xFF0D6B4F)),
    _Category('New\nReleases', Color(0xFFB06A52)),
    _Category('Happy\nChristmas', Color(0xFF8C1E32)),
    _Category('Fitness', Color(0xFF777777)),
    _Category('GLOW', Color(0xFF1E7BF5)),
    _Category('Pinoy Music', Color(0xFF2A8F6A)),
    _Category('Pop', Color(0xFF4F7F9F)),
    _Category('EQUAL', Color(0xFF1E9E2F)),
  ];

  static const List<_CardItem> _playlists = [
    _CardItem('Videos\nFor You', Color(0xFF3A3F5C)),
    _CardItem('Warm Fuzzy\nFeeling', Color(0xFF5C6670)),
    _CardItem('90s Love\nSongs', Color(0xFF2B2B2B)),
  ];

  static const List<_CardItem> _episodes = [
    _CardItem('Supporting individual\nartist projects', Color(0xFF4A5568)),
    _CardItem('ep 49: wala naman akong\nchoice kundi kayanin', Color(0xFF8A6A3A)),
    _CardItem('Love: True\nJust Giving', Color(0xFF3F5F3A)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF121212),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: profile + title + camera
              const Padding(
                padding: EdgeInsets.fromLTRB(kPagePadding, 20, kPagePadding, 16),
                child: Row(
                  children: [
                    ProfileAvatar(),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Icon(Icons.photo_camera_outlined,
                        size: 30, color: Colors.white),
                  ],
                ),
              ),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, size: 28, color: Colors.black),
                      SizedBox(width: 12),
                      Text(
                        'What do you want to listen to?',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _CategoryGrid(items: _topCategories),

              const _SectionTitle('Playlists you can watch'),
              _HorizontalCards(items: _playlists),

              const _SectionTitle('Explore episodes for you'),
              _HorizontalCards(items: _episodes),

              const SizedBox(height: 20),

              _CategoryGrid(items: _moreCategories),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data classes
// ---------------------------------------------------------------------------

class _Category {
  final String title;
  final Color color;
  const _Category(this.title, this.color);
}

class _CardItem {
  final String title;
  final Color color;
  const _CardItem(this.title, this.color);
}

// ---------------------------------------------------------------------------
// Widgets
// ---------------------------------------------------------------------------

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kPagePadding, 16, kPagePadding, 12),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  final List<_Category> items;
  const _CategoryGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          mainAxisExtent: 90,
        ),
        itemBuilder: (context, i) => _CategoryTile(item: items[i]),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final _Category item;
  const _CategoryTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        color: item.color,
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              right: -12,
              bottom: -8,
              child: Transform.rotate(
                angle: 0.436,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalCards extends StatelessWidget {
  final List<_CardItem> items;
  const _HorizontalCards({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final item = items[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [item.color, Colors.black87],
                ),
              ),
              padding: const EdgeInsets.all(12),
              alignment: Alignment.bottomLeft,
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}