import 'package:flutter/material.dart';
import 'shared/bottom_bar.dart';
import 'shared/constants.dart';

class AddAccountPage extends StatelessWidget {
  const AddAccountPage({super.key});

  static const List<_Member> _members = [
    _Member('Nonoy', 'N', Color(0xFFB9A1D6), isManager: true),
    _Member('Member A', 'A', Color(0xFF9E9E9E)),
    _Member('Member B', 'B', Color(0xFFF26B2C)),
    _Member('Member C', 'C', Color(0xFF6B8E5A)),
    _Member('Member D', 'D', Color(0xFFFF6B35)),
    _Member('Member E', 'E', Color(0xFF5C5470)),
  ];

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
                      'Add account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 26), // balances the back arrow
                ],
              ),
            ),

            // SCROLLING CONTENT
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
                children: [
                  const _SectionLabel('Plan members'),
                  ..._members.map((m) => _MemberRow(member: m)),

                  const _ActionRow(
                    icon: Icons.groups_outlined,
                    title: 'Edit your plan',
                    subtitle: 'Add or remove members',
                  ),

                  const SizedBox(height: 16),
                  const _SectionLabel('Other accounts'),
                  const _ActionRow(
                    icon: Icons.add,
                    title: 'Add a different account',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Member {
  final String name;
  final String letter;
  final Color color;
  final bool isManager;
  const _Member(this.name, this.letter, this.color, {this.isManager = false});
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 15),
      ),
    );
  }
}

class _MemberRow extends StatelessWidget {
  final _Member member;
  const _MemberRow({required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: member.color,
            child: Text(
              member.letter,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 4),
                member.isManager
                    ? const Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'Added · Plan manager',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      )
                    : const Text(
                        'Plan member',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  const _ActionRow({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFF2A2A2A),
            child: Icon(icon, color: Colors.grey.shade300, size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}