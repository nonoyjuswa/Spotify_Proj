import 'package:flutter/material.dart';
import 'playing_screen.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PlayingScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color(0xFF3E2A2A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset('images/joshua.jpg', width: 40, height: 40, fit: BoxFit.cover),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Man Who can't Be Moved",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      Text("Joshua Tamayo",
                          style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ],
                  ),
                ),
                Icon(Icons.devices, color: Colors.white, size: 22),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () => setState(() => isPlaying = !isPlaying),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 6),
              ],
            ),
            SizedBox(height: 4),
            // progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: 0.4,
                minHeight: 2,
                backgroundColor: Colors.grey.shade700,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}