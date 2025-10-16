import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/server_provider.dart';
import '../widgets/add_key_button.dart';
import '../widgets/server_tile.dart';

class AllTab extends StatelessWidget {
  final double contentWidth;
  const AllTab({Key? key, required this.contentWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Мои точки доступа',
              style: TextStyle(
                color: Color(0xFF7B89A2),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 8),
            AddKeyButton(width: contentWidth, onTap: () {}),
            SizedBox(height: 12),
            ServerTile(
              server: prov.mainMyServer,
              width: contentWidth,
              showDelete: false,
            ),
            SizedBox(height: 12),
            Text(
              'Германия',
              style: TextStyle(
                color: Color(0xFF7B89A2),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 8),
            ...prov.allServers
                .where((s) => s.country == 'Германия')
                .map((s) => ServerTile(server: s, width: contentWidth)),
            SizedBox(height: 12),
            Text(
              'США',
              style: TextStyle(
                color: Color(0xFF7B89A2),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 8),
            ...prov.allServers
                .where((s) => s.country == 'США')
                .map((s) => ServerTile(server: s, width: contentWidth)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}