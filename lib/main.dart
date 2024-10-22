import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Cashop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casio',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Casio Shop',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xff585858),
            shadows: [
              Shadow(
                color: Color(0xb182fd51),
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xb182fd51),
      ),
      backgroundColor: Color(0xb182fd51),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0), // เพิ่ม padding
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the Shop1 page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cashop()),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 80),
                textStyle: TextStyle(fontSize: 30),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff000000)),
            child: Text('ไปที่ร้าน'),
          ),
        ),
      ),
    );
  }
}
