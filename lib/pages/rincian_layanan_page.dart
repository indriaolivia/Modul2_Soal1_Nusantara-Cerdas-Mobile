 import 'package:flutter/material.dart';
import '../data/data_layanan.dart';

class RincianLayananPage extends StatelessWidget {
  final Layanan layanan;
  const RincianLayananPage({super.key, required this.layanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Layanan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Icon(layanan.ikon,
                  size: 64, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Text(layanan.nama,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Dinas Penanggung Jawab'),
              subtitle: Text(layanan.dinas),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Jam Operasional'),
              subtitle: Text(layanan.jamOperasional),
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Keterangan'),
              subtitle: Text(layanan.keterangan),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('Ajukan Permohonan'),
              onPressed: () => Navigator.pop(
                context,
                'Permohonan ${layanan.nama} telah diajukan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}