import 'package:flutter/material.dart';
import 'Watch.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchDetail extends StatelessWidget {
  final Ca;

  const WatchDetail({Key? key, required this.Ca}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Ca.name ?? '',
          style: GoogleFonts.roboto(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
            shadows: [
              Shadow(
                color: Color(0xfffdff85),
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffeaeaea),
      ),
      backgroundColor: Color(0xffeaeaea),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(Ca.imageUrl ?? ''),
            const SizedBox(height: 16),
            Text(
              Ca.name ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\฿${Ca.price}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'รายละเอียด: ${Ca.brand ?? ''}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
