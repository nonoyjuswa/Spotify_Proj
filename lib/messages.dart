import 'package:flutter/material.dart';
import 'shared/bottom_bar.dart';
import 'shared/profile_avatar.dart';
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
      home: const SpotifyMessagesPage(),
    );
  }
}

class SpotifyMessagesPage extends StatefulWidget {
  const SpotifyMessagesPage({super.key});

  @override
  State<SpotifyMessagesPage> createState() => _SpotifyMessagesPageState();
}

class _SpotifyMessagesPageState extends State<SpotifyMessagesPage> {
  int selectedFilter = 0; // 0: All, 1: Unread, 2: Music Shared, 3: Groups

  final List<String> filters = const ['All', 'Unread', 'Music Shared', 'Groups'];

  // Mock Active Listening Friends Data
  final List<Map<String, dynamic>> activeFriends = const [
    {
      'name': 'Marcus V.',
      'status': 'Listening to Drake',
      'color': Color(0xFF514475),
      'isListening': true,
    },
    {
      'name': 'Elena R.',
      'status': 'Listening to Kid Cudi',
      'color': Color(0xFF385B43),
      'isListening': true,
    },
    {
      'name': 'Alex Rivera',
      'status': 'Active now',
      'color': Color(0xFF76523F),
      'isListening': false,
    },
    {
      'name': 'Sarah P.',
      'status': 'Listening to Jack Harlow',
      'color': Color(0xFF34536B),
      'isListening': true,
    },
  ];

  // Mock Messages Data
  final List<Map<String, dynamic>> messages = const [
    {
      'sender': 'Marcus Vance',
      'avatarColor': Color(0xFF514475),
      'message': 'Check out this playlist I made for the weekend!',
      'sharedItem': 'Late Night Vibes • Playlist',
      'time': '2m ago',
      'isUnread': true,
      'hasSharedItem': true,
      'isGroup': false,
    },
    {
      'sender': 'Elena Rostova',
      'avatarColor': Color(0xFF385B43),
      'message': 'Loved that album recommendation 🔥',
      'sharedItem': '',
      'time': '18m ago',
      'isUnread': true,
      'hasSharedItem': false,
      'isGroup': false,
    },
    {
      'sender': 'Weekend Squad Jam 🎵',
      'avatarColor': Color(0xFF806F27),
      'message': 'Alex added 3 tracks to the group queue',
      'sharedItem': '',
      'time': '1h ago',
      'isUnread': false,
      'hasSharedItem': false,
      'isGroup': true,
    },
    {
      'sender': 'David Chen',
      'avatarColor': Color(0xFF34536B),
      'message': 'Have you heard this new track yet?',
      'sharedItem': 'KYRIE • KTDF Choir',
      'time': 'Yesterday',
      'isUnread': false,
      'hasSharedItem': true,
      'isGroup': false,
    },
    {
      'sender': 'Sarah Parker',
      'avatarColor': Color(0xFF76523F),
      'message': 'Are you going to the concert this Friday?',
      'sharedItem': '',
      'time': '2d ago',
      'isUnread': false,
      'hasSharedItem': false,
      'isGroup': false,
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
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 12),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Color(0xFF1DB954),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Messages',
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
                                size: 26,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_note,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Filter Choice Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(filters.length, (index) {
                            final isSelected = selectedFilter == index;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(filters[index]),
                                selected: isSelected,
                                onSelected: (_) {
                                  setState(() => selectedFilter = index);
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

                      // Friends Active / Listening Row
                      const Text(
                        'Friends Listening',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        height: 110,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: activeFriends.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 16),
                          itemBuilder: (context, index) {
                            final friend = activeFriends[index];
                            final isListening = friend['isListening'] as bool;
                            return SizedBox(
                              width: 76,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 62,
                                        height: 62,
                                        decoration: BoxDecoration(
                                          color: friend['color'] as Color,
                                          shape: BoxShape.circle,
                                          border: isListening
                                              ? Border.all(
                                                  color: const Color(0xFF1DB954),
                                                  width: 2,
                                                )
                                              : null,
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: isListening
                                                ? const Color(0xFF1DB954)
                                                : const Color(0xFF535353),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFF121212),
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                            isListening
                                                ? Icons.music_note
                                                : Icons.circle,
                                            size: 10,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    friend['name'] as String,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    isListening ? 'Listening' : 'Online',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Direct Messages List Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Conversations',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Requests (2)',
                              style: TextStyle(
                                color: Color(0xFF1DB954),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final msg = messages[index];
                          final isUnread = msg['isUnread'] as bool;
                          final hasSharedItem = msg['hasSharedItem'] as bool;
                          final isGroup = msg['isGroup'] as bool;

                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUnread
                                  ? const Color(0xFF242424)
                                  : const Color(0xFF181818),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: msg['avatarColor'] as Color,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        isGroup
                                            ? Icons.group
                                            : Icons.person,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                    ),
                                    if (isUnread)
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF1DB954),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFF242424),
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            msg['sender'] as String,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: isUnread
                                                  ? FontWeight.w800
                                                  : FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            msg['time'] as String,
                                            style: TextStyle(
                                              color: isUnread
                                                  ? const Color(0xFF1DB954)
                                                  : Colors.grey,
                                              fontSize: 10,
                                              fontWeight: isUnread
                                                  ? FontWeight.w700
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        msg['message'] as String,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: isUnread
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      if (hasSharedItem) ...[
                                        const SizedBox(height: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF2D2D2D),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.headphones,
                                                color: Color(0xFF1DB954),
                                                size: 16,
                                              ),
                                              const SizedBox(width: 6),
                                              Flexible(
                                                child: Text(
                                                  msg['sharedItem'] as String,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

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
}