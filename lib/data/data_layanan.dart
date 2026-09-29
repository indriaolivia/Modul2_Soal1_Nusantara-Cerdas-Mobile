import 'package:flutter/material.dart';

class Layanan {
  final String nama;
  final String dinas;
  final String jamOperasional;
  final String keterangan;
  final IconData ikon;

  const Layanan({
    required this.nama,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
    required this.ikon,
  });
}

const Map<String, List<Layanan>> dataLayanan = {
  'Perizinan': [
    Layanan(
      nama: 'Izin Usaha',
      dinas: 'Dinas Penanaman Modal & PTSP',
      jamOperasional: 'Senin–Jumat, 08.00–15.00',
      keterangan: 'Penerbitan izin usaha mikro, kecil, dan menengah.',
      ikon: Icons.storefront,
    ),
    Layanan(
      nama: 'Izin Mendirikan Bangunan',
      dinas: 'Dinas Pekerjaan Umum & Tata Ruang',
      jamOperasional: 'Senin–Jumat, 08.00–15.30',
      keterangan: 'Persetujuan bangunan gedung untuk hunian dan usaha.',
      ikon: Icons.apartment,
    ),
    Layanan(
      nama: 'Izin Keramaian',
      dinas: 'Dinas Kesatuan Bangsa & Politik',
      jamOperasional: 'Senin–Jumat, 08.00–14.00',
      keterangan: 'Rekomendasi kegiatan yang melibatkan banyak orang.',
      ikon: Icons.groups,
    ),
  ],
  'Kesehatan': [
    Layanan(
      nama: 'Pendaftaran Puskesmas Online',
      dinas: 'Dinas Kesehatan',
      jamOperasional: 'Setiap hari, 07.00–20.00',
      keterangan: 'Ambil antrean pemeriksaan tanpa datang lebih awal.',
      ikon: Icons.local_hospital,
    ),
    Layanan(
      nama: 'Imunisasi Anak',
      dinas: 'Dinas Kesehatan',
      jamOperasional: 'Senin–Sabtu, 08.00–12.00',
      keterangan: 'Jadwal dan pendaftaran imunisasi dasar lengkap.',
      ikon: Icons.vaccines,
    ),
    Layanan(
      nama: 'Ambulans Gawat Darurat',
      dinas: 'Dinas Kesehatan & BPBD',
      jamOperasional: '24 jam',
      keterangan: 'Layanan ambulans untuk kondisi darurat warga.',
      ikon: Icons.emergency,
    ),
  ],
  'Transportasi': [
    Layanan(
      nama: 'Perpanjangan Trayek Angkutan',
      dinas: 'Dinas Perhubungan',
      jamOperasional: 'Senin–Jumat, 08.00–15.00',
      keterangan: 'Perpanjangan izin trayek angkutan umum kota.',
      ikon: Icons.directions_bus,
    ),
    Layanan(
      nama: 'Uji Kir Kendaraan',
      dinas: 'Dinas Perhubungan',
      jamOperasional: 'Senin–Jumat, 08.00–14.30',
      keterangan: 'Pengujian kelaikan kendaraan bermotor umum.',
      ikon: Icons.car_repair,
    ),
    Layanan(
      nama: 'Izin Parkir Khusus',
      dinas: 'Dinas Perhubungan',
      jamOperasional: 'Senin–Jumat, 08.00–15.00',
      keterangan: 'Permohonan lokasi dan izin parkir khusus.',
      ikon: Icons.local_parking,
    ),
  ],
};