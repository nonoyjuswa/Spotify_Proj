
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayingScreen(),
    ),
  );
}

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({super.key});

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {

  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),

      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        leading: Icon(Icons.keyboard_arrow_down,
            color: Colors.white),
        title: Column(
          children: [
            Text("PLAYING FROM PLAYLIST",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                )),
            Text("Daily Mix",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                )),
          ],
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            children: [

              SizedBox(height: 15),

              // ALBUM IMAGE
              Image.asset(
  'images/joshua.jpg',
  height: 250,
  width: 250,
  fit: BoxFit.cover,
),

              SizedBox(height: 25),

              // SONG DETAILS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Man Who can't Be Moved",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Joshua Tamayo",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          )),
                    ],
                  ),
                  Icon(Icons.favorite,
                      color: Colors.green, size: 30),
                ],
              ),

              SizedBox(height: 20),

              // SONG PROGRESS
              Column(
                children: [
                  Slider(
                    value: 0.4,
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1:24",
                          style: TextStyle(color: Colors.grey)),
                      Text("4:23",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15),

              // MUSIC CONTROLS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.shuffle, color: Colors.green),

                  Icon(Icons.skip_previous,
                      color: Colors.white, size: 40),

                  IconButton(
                    iconSize: 65,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                    ),
                  ),

                  Icon(Icons.skip_next,
                      color: Colors.white, size: 40),

                  Icon(Icons.repeat, color: Colors.green),
                ],
              ),

              SizedBox(height: 20),

              // BOTTOM OPTIONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.devices, color: Colors.grey),
                  Icon(Icons.queue_music, color: Colors.grey),
                  Icon(Icons.share, color: Colors.grey),
                ],
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
