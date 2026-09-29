import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Indria Olivia'),
            subtitle: Text('NIK: 3201•••••••0001\nKelurahan Cerdas, Kota Nusantara'),
            isThreeLine: true,
          ),
        ),
        const SizedBox(height: 16),
        Text('Laporan Terakhir',
            style: Theme.of(context).textTheme.titleMedium),
        const ListTile(
          leading: Icon(Icons.report_problem_outlined),
          title: Text('Lampu jalan mati'),
          subtitle: Text('Status: Diproses'),
        ),
        const ListTile(
          leading: Icon(Icons.report_problem_outlined),
          title: Text('Sampah menumpuk'),
          subtitle: Text('Status: Selesai'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          icon: const Icon(Icons.history),
          label: const Text('Buka Riwayat Laporan'),
          onPressed: () =>
              Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
        ),
      ],
    );
  }
}