import 'package:flutter/material.dart';
import '../add_account.dart';
import '../premium.dart';
import '../profile.dart';

const Color _drawerBg = Color(0xFF1F1F1F);
const Color _cardBg = Color(0xFF2A2A2A);

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool showBanner = true;

  void _go(Widget page) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      backgroundColor: _drawerBg,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            // PROFILE + ADD ACCOUNT CARD
            Container(
              decoration: BoxDecoration(
                color: _cardBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _go(const ProfilePage()),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 32,
                            backgroundColor: Color(0xFFB9A1D6),
                            child: Text('N',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Nonoy',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(height: 4),
                              Text('View profile',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, color: Colors.white12),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _go(const AddAccountPage()),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFF3A3A3A),
                            child: Icon(Icons.add,
                                color: Colors.grey, size: 20),
                          ),
                          SizedBox(width: 16),
                          Text('Add account',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // MENU ITEMS
            _MenuRow(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.graphic_eq, color: Colors.black, size: 20),
              ),
              title: 'Your Premium',
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFD7A8F8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Family',
                    style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
              onTap: () => _go(const PremiumPage()),
            ),
            const _MenuRow(icon: Icons.show_chart, title: 'Listening stats'),
            const _MenuRow(icon: Icons.history, title: 'Recents'),
            const _MenuRow(
                icon: Icons.campaign_outlined, title: 'Your Updates'),
            const _MenuRow(
                icon: Icons.settings_outlined, title: 'Settings and privacy'),

            const SizedBox(height: 12),

            // ACTIVITY + INVITE FRIENDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3),
                        ),
                        child: const CircleAvatar(
                          radius: 26,
                          backgroundColor: Color(0xFFB9A1D6),
                          child: Text('N',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('Activity',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14)),
                      const Text('On',
                          style:
                              TextStyle(color: Colors.green, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(width: 28),
                  Column(
                    children: const [
                      SizedBox(height: 4),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: _cardBg,
                        child: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                      SizedBox(height: 8),
                      Text('Invite friends',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // MESSAGES HEADER
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text('Messages',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800)),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right, color: Colors.white, size: 28),
                  Spacer(),
                  Icon(Icons.edit_square, color: Colors.white, size: 26),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // PUSH NOTIFICATION BANNER
            if (showBanner)
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                decoration: BoxDecoration(
                  color: _cardBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Turn on push notifications so you don’t miss a reply.',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.notifications_none,
                              color: Colors.black, size: 20),
                          SizedBox(width: 6),
                          Text('Turn on',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => setState(() => showBanner = false),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 8),

            const _MenuRow(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: _cardBg,
                child: Icon(Icons.edit_square, color: Colors.grey, size: 28),
              ),
              title: 'New message',
              titleSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final IconData? icon;
  final Widget? leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final double titleSize;
  final VoidCallback? onTap;

  const _MenuRow({
    this.icon,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.titleSize = 18,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        child: Row(
          children: [
            leading ?? Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white, fontSize: titleSize)),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(subtitle!,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 14)),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}