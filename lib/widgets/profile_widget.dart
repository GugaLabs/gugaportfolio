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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        CircleAvatar(
          minRadius: MediaQuery.sizeOf(context).height * 0.15,
          backgroundImage: AssetImage(
            photoPath,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
