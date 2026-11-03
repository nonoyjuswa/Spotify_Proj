import 'package:flutter/material.dart';
import 'profile_avatar.dart';
import 'constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF121212),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: kPagePadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header: profile + camera
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProfileAvatar(),
                              Icon(Icons.photo_camera_outlined, size: 30, color: Colors.white),
                            ],
                          ),
                        ),

                        // Title
                        Container(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                        // Search bar + mic
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 52,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: 28,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Artist, songs, or podcasts',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.mic_none_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        // Browse all
                        Container(
                          padding: EdgeInsets.only(top: 24, bottom: 12),
                          child: Text(
                            'Browse all',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        // Row 1
                        Container(
                          margin: EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDC148C),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Music',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 14),
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF006450),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Podcasts',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
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

                        // Row 2
                        Container(
                          margin: EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8400E7),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Live Events',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 14),
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1E3264),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Made For You',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
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

                        // Row 3
                        Container(
                          margin: EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE8115B),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'New Releases',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 14),
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFAF2896),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '2023 In Music',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
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

                        // Row 5
                        Container(
                          margin: EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE13300),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Afro',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 14),
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF509BF5),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Party',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            transform: Matrix4.rotationZ(0.436),
                                            transformAlignment:
                                                Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
