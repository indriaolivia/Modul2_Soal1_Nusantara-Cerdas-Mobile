import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  void _info(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    const riwayat = [
      ('Lampu jalan mati', 'Diproses'),
      ('Sampah menumpuk', 'Selesai'),
      ('Jalan berlubang', 'Selesai'),
      ('Saluran air tersumbat', 'Ditolak'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: ListView(
        children: [
          for (final r in riwayat)
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: Text(r.$1),
              subtitle: Text('Status: ${r.$2}'),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _info(context, 'Buat laporan baru'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              tooltip: 'Filter',
              icon: const Icon(Icons.filter_list),
              onPressed: () => _info(context, 'Filter laporan'),
            ),
            IconButton(
              tooltip: 'Cari',
              icon: const Icon(Icons.search),
              onPressed: () => _info(context, 'Cari laporan'),
            ),
            IconButton(
              tooltip: 'Bagikan',
              icon: const Icon(Icons.share),
              onPressed: () => _info(context, 'Bagikan laporan'),
            ),
          ],
        ),
      ),
    );
  }
}