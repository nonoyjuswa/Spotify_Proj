import 'package:flutter/material.dart';
import 'shared/bottom_bar.dart';
import 'shared/constants.dart';

const double _cardSize = 165;

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            // STICKY HEADER
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kPagePadding, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 26),
                  ),
                  const Expanded(
                    child: Text(
                      'Your Premium',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 26),
                ],
              ),
            ),

            // SCROLLING CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: kPagePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Premium',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Member since February 2024',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const _PlanCard(),
                    const SizedBox(height: 20),

                    // BENEFITS HEADER
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: kPagePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your benefits',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12)),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ready for you, Nonoy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text('Show more',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // TRY FITNESS VIDEOS
                    const _SectionTitle('Try fitness videos'),
                    _HorizontalList(
                      children: const [
                        _FitnessCard(
                          title: 'Browse Weighted\nWorkouts',
                          caption:
                              'Grab your weights, choose your own adventure and dive into Pelo...',
                          color: Color(0xFF5C6670),
                        ),
                        _FitnessCard(
                          title: 'Browse Yoga\nWorkouts',
                          caption:
                              "Grab your mat and dive into Peloton's collection of yoga classe...",
                          color: Color(0xFF6B6B6B),
                        ),
                        _FitnessCard(
                          title: 'Browse\nWorkouts',
                          caption: 'Floor cardio, no equipment needed',
                          color: Color(0xFF4A5568),
                        ),
                      ],
                    ),

                    // MIX YOUR PLAYLISTS
                    const _SectionTitle('Mix your playlists'),
                    _HorizontalList(
                      children: const [
                        _MixCard(
                          title: 'Ms. Independent',
                          colors: [
                            Color(0xFFB23A48),
                            Color(0xFFC9A66B),
                            Color(0xFF6B4F3A),
                            Color(0xFF3A3A3A),
                          ],
                        ),
                        _MixCard(
                          title: 'Safe Space Act',
                          colors: [
                            Color(0xFF7A6A55),
                            Color(0xFF2B2B33),
                            Color(0xFF4A3F36),
                            Color(0xFFD08A3C),
                          ],
                        ),
                        _MixCard(
                          title: '(ㅠ_ㅠ)',
                          colors: [
                            Color(0xFF3A4A5C),
                            Color(0xFF5C6670),
                            Color(0xFF2B3A4A),
                            Color(0xFF6B7A8A),
                          ],
                        ),
                      ],
                    ),

                    // SUGGESTED DOWNLOADS
                    const _SectionTitle('Suggested downloads'),
                    _HorizontalList(
                      children: const [
                        _DownloadCard(
                          caption:
                              'Olivia Dean, ADÉLA, Malcolm Todd, Dominic Fike, Holly Humber...',
                          color: Color(0xFFD8B8A8),
                          label: 'Chillax\nKa Muna!',
                        ),
                        _DownloadCard(
                          caption:
                              'Laufey, beabadoobee, Conan Gray, kuala, STUTS',
                          color: Color(0xFFF2A9A9),
                          label: 'tapioca',
                        ),
                        _DownloadCard(
                          caption: 'Teddy Swims, Mariah Carey',
                          color: Color(0xFF3A4A6B),
                          label: 'mag',
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // EXPLORE MORE
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade600),
                        ),
                        child: const Text(
                          'Explore more benefits',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Plan card
// ---------------------------------------------------------------------------

class _PlanCard extends StatelessWidget {
  const _PlanCard();

  static const List<_Avatar> _avatars = [
    _Avatar('N', Color(0xFFB9A1D6)),
    _Avatar('A', Color(0xFF9E9E9E)),
    _Avatar('B', Color(0xFF6B8E5A)),
    _Avatar('D', Color(0xFFFF6B35)),
    _Avatar('C', Color(0xFF5C5470)),
    _Avatar('M', Color(0xFFF26B2C)),
  ];

  @override
  Widget build(BuildContext context) {
    const double r = 16;
    const double step = 22;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPagePadding),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF6A2F8F),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.graphic_eq, color: Color(0xFFD7B3F0), size: 18),
              SizedBox(width: 6),
              Text('Premium',
                  style: TextStyle(
                      color: Color(0xFFD7B3F0),
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 6),
          const Text('Family',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 36),
          Row(
            children: [
              SizedBox(
                width: step * (_avatars.length - 1) + r * 2,
                height: r * 2,
                child: Stack(
                  children: [
                    for (int i = 0; i < _avatars.length; i++)
                      Positioned(
                        left: i * step,
                        child: CircleAvatar(
                          radius: r,
                          backgroundColor: _avatars[i].color,
                          child: Text(
                            _avatars[i].letter,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: const Text('Manage',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Avatar {
  final String letter;
  final Color color;
  const _Avatar(this.letter, this.color);
}

// ---------------------------------------------------------------------------
// Section helpers
// ---------------------------------------------------------------------------

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kPagePadding, 32, kPagePadding, 12),
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

class _HorizontalList extends StatelessWidget {
  final List<Widget> children;
  const _HorizontalList({required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
        itemCount: children.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, i) => children[i],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Cards
// ---------------------------------------------------------------------------

class _FitnessCard extends StatelessWidget {
  final String title;
  final String caption;
  final Color color;
  const _FitnessCard(
      {required this.title, required this.caption, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _cardSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              width: _cardSize,
              height: _cardSize,
              color: color,
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('PELOTON',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 11,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700)),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 32, // fits 2 lines at fontSize 12
            child: Text(caption,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),),
          const SizedBox(height: 12),
          const Icon(Icons.add_circle_outline, color: Colors.grey, size: 26),
        ],
      ),
    );
  }
}

class _MixCard extends StatelessWidget {
  final String title;
  final List<Color> colors; // 4 colors for the 2x2 cover
  const _MixCard({required this.title, required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _cardSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              width: _cardSize,
              height: _cardSize,
              child: GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [for (final c in colors) Container(color: c)],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          const Text('Nonoy',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.tune, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text('Mix',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DownloadCard extends StatelessWidget {
  final String caption;
  final Color color;
  final String label;
  const _DownloadCard(
      {required this.caption, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _cardSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              width: _cardSize,
              height: _cardSize,
              color: color,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 32, // fits 2 lines at fontSize 12
            child: Text(caption,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 12)
            ),
          ),
          const SizedBox(height: 12),
          const Icon(Icons.arrow_circle_down_outlined,
              color: Colors.grey, size: 26),
        ],
      ),
    );
  }
}