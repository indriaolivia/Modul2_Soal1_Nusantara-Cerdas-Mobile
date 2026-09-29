import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PengaturanKotaPage extends StatelessWidget {
  const PengaturanKotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(
        children: [
          const SwitchListTile(
            value: true,
            onChanged: null,
            title: Text('Notifikasi layanan'),
          ),
          const ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Kota aktif'),
            subtitle: Text('Kota Nusantara'),
          ),
          const Divider(),
          // Untuk menguji onUnknownRoute dengan nama route salah tulis.
          ListTile(
            leading: const Icon(Icons.bug_report, color: Colors.orange),
            title: const Text('Uji route tidak dikenal'),
            subtitle: const Text('Memanggil "/layanan-salah-tulis"'),
            onTap: () => Navigator.pushNamed(context, '/layanan-salah-tulis'),
          ),
        ],
      ),
    );
  }
}

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_city, size: 72),
              SizedBox(height: 12),
              Text('Nusantara Cerdas Mobile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Versi 1.0.0'),
              SizedBox(height: 12),
              Text(
                'Aplikasi layanan warga Smart City Kota Nusantara '
                'dari Dinas Komunikasi dan Informatika.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeluarPage extends StatelessWidget {
  const KeluarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keluar')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Yakin ingin keluar dari aplikasi?'),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Keluar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RouteTidakDikenalPage extends StatelessWidget {
  final String? namaRoute;
  const RouteTidakDikenalPage({super.key, this.namaRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 72, color: Colors.red),
              const SizedBox(height: 12),
              Text('Route "$namaRoute" tidak terdaftar.',
                  textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}