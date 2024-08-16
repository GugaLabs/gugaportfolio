import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String name;
  final String description;
  final String photoPath;

  const ProfileWidget({
    super.key,
    required this.title,
    required this.name,
    required this.description,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.2,
        height: MediaQuery.sizeOf(context).height * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // color: Colors.black,
        ),
        child: Stack(
          children: [
            // Diagonal Cut Background
            Positioned.fill(
              child: ClipPath(
                clipper: DiagonalClipper(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      photoPath,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Content Overlay
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  // Name Text
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Description Text
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Arrow Icon
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
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

// Custom Clipper for Diagonal Cut
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 65);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
