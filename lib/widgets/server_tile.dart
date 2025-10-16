import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/models/server.dart';
import '../provider/server_provider.dart';

class ServerTile extends StatelessWidget {
  final Server server;
  final double width;
  final bool showDelete;

  const ServerTile({
    Key? key,
    required this.server,
    required this.width,
    this.showDelete = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);
    final isFav = prov.isFavorite(server.id);
    final isSelected = prov.selectedId == server.id;

    final shouldShowDelete = showDelete && !server.isMainMyServer;

    return GestureDetector(
      onTap: () => prov.selectServer(server.id),
      child: Container(
        width: width,
        height: 68,
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255,255,255,0.02),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected ? Color(0xFF02A9FF) : Color.fromRGBO(255,255,255,0.12),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(255,255,255,0.05),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/img.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    server.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${server.pingMs} мс',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF7B89A2),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                if (shouldShowDelete)
                  Text(
                    'Удалить',
                    style: TextStyle(
                      color: Color(0xFFD32B3E),
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                if (shouldShowDelete) SizedBox(width: 8),
                GestureDetector(
                  onTap: () => prov.toggleFavorite(server.id),
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: isFav ? Color(0xFFC952F5) : Color(0xFF2B3E58),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

