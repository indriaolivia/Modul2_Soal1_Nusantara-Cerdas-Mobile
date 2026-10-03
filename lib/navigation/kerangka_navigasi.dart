import 'package:flutter/material.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import 'ikon_warga_badge.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeks = 0;

  static const _judul = ['Beranda', 'Layanan', 'Warga'];
  static const _halaman = <Widget>[BerandaPage(), LayananPage(), WargaPage()];

  void _pilih(int i) => setState(() => _indeks = i);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Bila bukan di Beranda, tombol kembali mengarah ke Beranda,
      // bukan menutup aplikasi.
      canPop: _indeks == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _pilih(0);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layarLebar = constraints.maxWidth >= 600;

          return Scaffold(
            appBar: AppBar(
              title: Text(_judul[_indeks]),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            drawer: _buildDrawer(context),
            body: layarLebar
                ? Row(
                    children: [
                      NavigationRail(
                        selectedIndex: _indeks,
                        onDestinationSelected: _pilih,
                        labelType: NavigationRailLabelType.all,
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.home_outlined),
                            selectedIcon: Icon(Icons.home),
                            label: Text('Beranda'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.miscellaneous_services_outlined),
                            selectedIcon: Icon(Icons.miscellaneous_services),
                            label: Text('Layanan'),
                          ),
                          NavigationRailDestination(
                            icon: IkonWargaBadge(),
                            selectedIcon: IkonWargaBadge(terpilih: true),   
                            label: Text('Warga'),
                          ),
                        ],
                      ),
                      const VerticalDivider(width: 1),
                      Expanded(
                        child: IndexedStack(index: _indeks, children: _halaman),
                      ),
                    ],
                  )
                : IndexedStack(index: _indeks, children: _halaman),
            // Layar lebar: bilah bawah disembunyikan.
            bottomNavigationBar: layarLebar
                ? null
                : NavigationBar(
                    selectedIndex: _indeks,
                    onDestinationSelected: _pilih,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: 'Beranda',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.miscellaneous_services_outlined),
                        selectedIcon: Icon(Icons.miscellaneous_services),
                        label: 'Layanan',
                      ),
                      NavigationDestination(
                        icon: IkonWargaBadge(),
                        selectedIcon: IkonWargaBadge(terpilih: true),
                        label: 'Warga',
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: _indeks,
      onDestinationSelected: (i) {
        // Tutup drawer lebih dulu sebelum apa pun.
        Navigator.pop(context);
        if (i <= 2) {
          _pilih(i);
        } else if (i == 3) {
          Navigator.pushNamed(context, AppRoutes.pengaturanKota);
        } else if (i == 4) {
          Navigator.pushNamed(context, AppRoutes.tentangAplikasi);
        } else {
          Navigator.pushNamed(context, AppRoutes.keluar);
        }
      },
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text('Nusantara Cerdas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: Text('Layanan'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Warga'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
          child: Divider(),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Pengaturan Kota'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.info_outline),
          selectedIcon: Icon(Icons.info),
          label: Text('Tentang Aplikasi'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.logout),
          selectedIcon: Icon(Icons.logout),
          label: Text('Keluar'),
        ),
      ],
    );
  }
}