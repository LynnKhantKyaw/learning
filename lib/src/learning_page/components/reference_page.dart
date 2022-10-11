import 'package:flutter/material.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({
    super.key,
    required this.str,
  });
  final String str;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            'Substainable Agriculture Research and Education , http//www.sare.org',
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
