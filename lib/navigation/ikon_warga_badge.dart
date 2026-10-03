import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pengajuan_model.dart';

class IkonWargaBadge extends StatelessWidget {
  final bool terpilih;
  const IkonWargaBadge({super.key, this.terpilih = false});

  @override
  Widget build(BuildContext context) {
    final total = context.select<PengajuanModel, int>(
      (m) => m.totalPengajuan,
    );

    return Badge(
      isLabelVisible: total > 0,
      label: Text('$total'),
      child: Icon(terpilih ? Icons.person : Icons.person_outline),
    );
  }
}