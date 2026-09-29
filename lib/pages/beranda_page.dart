import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  static const _pilar = [
    (Icons.account_balance, 'Smart Governance'),
    (Icons.trending_up, 'Smart Economy'),
    (Icons.eco, 'Smart Environment'),
    (Icons.home_work, 'Smart Living'),
    (Icons.directions_transit, 'Smart Mobility'),
    (Icons.people, 'Smart People'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Enam Pilar Smart City',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 3 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            for (final p in _pilar)
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(p.$1,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 8),
                    Text(p.$2, textAlign: TextAlign.center),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}