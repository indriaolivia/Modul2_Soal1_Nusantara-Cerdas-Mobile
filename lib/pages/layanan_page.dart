import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_layanan.dart';
import '../models/favorit_model.dart';
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _TombolFavorit(namaLayanan: layanan.nama),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
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

class _TombolFavorit extends StatelessWidget {
  final String namaLayanan;
  const _TombolFavorit({required this.namaLayanan});

  @override
  Widget build(BuildContext context) {
    // watch: warna ikon harus ikut berubah saat status favorit berubah.
    final favorit =
        context.watch<FavoritModel>().apakahFavorit(namaLayanan);

    return IconButton(
      tooltip: favorit ? 'Batalkan favorit' : 'Tandai favorit',
      icon: Icon(
        favorit ? Icons.star : Icons.star_border,
        color: favorit ? Colors.amber : null,
      ),
      // read: di dalam callback, cukup memanggil metode tanpa berlangganan.
      onPressed: () {
        final model = context.read<FavoritModel>();
        favorit ? model.batalTandai(namaLayanan) : model.tandai(namaLayanan);
      },
    );
  }
}