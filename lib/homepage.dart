// ignore_for_file: unused_import, use_super_parameters

import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/bantuan.dart';
import 'package:kuis_prakmobile/login_page.dart';
import 'package:kuis_prakmobile/daftar_barang_dummy.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Selamat datang, $username!',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Bantuan()),
              );
            },
            child: const Text(
              'Butuh Bantuan? Klik untuk pergi ke halaman Panduan dan Dukungan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: supermarketItemList.length,
              itemBuilder: (context, index) {
                final SupermarketItem item = supermarketItemList[index];
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          item.imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(item.price),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
