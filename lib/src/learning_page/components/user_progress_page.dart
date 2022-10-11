import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class UserProgress extends StatelessWidget {
  const UserProgress({
    super.key,
    required this.str,
  });
  final String str;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            'Chapter 1 Soil Oil',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 20),
          Text(
            str,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
