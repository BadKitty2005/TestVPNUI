import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/server_provider.dart';
import '../widgets/add_key_button.dart';
import '../widgets/server_tile.dart';

class MyTab extends StatelessWidget {
  final double contentWidth;
  const MyTab({Key? key, required this.contentWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);
    final servers = prov.myServers;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddKeyButton(width: contentWidth, onTap: () {}),
            SizedBox(height: 12),
            ServerTile(
              server: prov.mainMyServer,
              width: contentWidth,
              showDelete: false,
            ),
            SizedBox(height: 12),
            ...servers
                .where((s) => !s.isMainMyServer)
                .map((s) => ServerTile(server: s, width: contentWidth, showDelete: true)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}