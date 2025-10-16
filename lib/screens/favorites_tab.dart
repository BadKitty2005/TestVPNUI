import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/server_provider.dart';
import '../widgets/server_tile.dart';

class FavoritesTab extends StatelessWidget {
  final double contentWidth;
  const FavoritesTab({Key? key, required this.contentWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);
    final servers = prov.filteredForTab(TabType.favorites);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            ...servers.map((s) => ServerTile(server: s, width: contentWidth, showDelete: false)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}