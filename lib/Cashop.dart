import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'Watch.dart';
import 'WatchDetail.dart'; // นำเข้า MotoDetail

class Cashop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop Page',
          style: GoogleFonts.roboto(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
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
      body: FutureBuilder(
        future: read_json_data(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<Watch>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchDetail(
                            Ca: item), // ส่งข้อมูลไปยังหน้ารายละเอียด
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(item.imageUrl ?? ''),
                          const SizedBox(height: 16),
                          Text(
                            item.name ?? '',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\฿${item.price}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Watch>> read_json_data() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('data/product.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Watch.fromJson(e)).toList();
  }
}
