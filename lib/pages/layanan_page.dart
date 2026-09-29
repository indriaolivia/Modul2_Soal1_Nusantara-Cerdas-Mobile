import 'package:flutter/material.dart';
import '../data/data_layanan.dart';
import '../navigation/app_routes.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  Future<void> _bukaRincian(BuildContext context, Layanan layanan) async {
    final hasil = await Navigator.pushNamed<String>(
      context,
      AppRoutes.rincianLayanan,
      arguments: layanan,
    );
    if (hasil != null && context.mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(hasil)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final kategori = dataLayanan.keys.toList();

    return DefaultTabController(
      length: kategori.length,
      child: Column(
        children: [
          TabBar(tabs: [for (final k in kategori) Tab(text: k)]),
          Expanded(
            child: TabBarView(
              children: [
                for (final k in kategori)
                  ListView.separated(
                    itemCount: dataLayanan[k]!.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, i) {
                      final layanan = dataLayanan[k]![i];
                      return ListTile(
                        leading: Icon(layanan.ikon),
                        title: Text(layanan.nama),
                        subtitle: Text(layanan.dinas),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => _bukaRincian(context, layanan),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}