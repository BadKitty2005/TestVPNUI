import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/server_provider.dart';

class SearchBarWidget extends StatefulWidget {
  final double width;
  const SearchBarWidget({Key? key, required this.width}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    final prov = Provider.of<ServerProvider>(context, listen: false);
    controller = TextEditingController(text: prov.searchQuery);
    prov.addListener(_provListener);
  }

  void _provListener() {
    final prov = Provider.of<ServerProvider>(context, listen: false);
    if (prov.searchQuery != controller.text) {
      controller.value = controller.value.copyWith(
        text: prov.searchQuery,
        selection: TextSelection.collapsed(offset: prov.searchQuery.length),
      );
    }
  }

  @override
  void dispose() {
    final prov = Provider.of<ServerProvider>(context, listen: false);
    prov.removeListener(_provListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);

    return Container(
      width: widget.width,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFF2B3E58),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(width: 2),
          Icon(Icons.search, color: Color.fromRGBO(255,255,255,0.4), size: 18),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              textDirection: TextDirection.ltr,
              onChanged: (v) {
                prov.updateSearchQuery(v);
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
              decoration: InputDecoration(
                hintText: 'Поиск',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(255,255,255,0.6),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (prov.searchQuery.isNotEmpty)
            GestureDetector(
              onTap: () {
                prov.updateSearchQuery('');
                controller.clear();
              },
              child: Icon(Icons.close, color: Color.fromRGBO(255,255,255,0.6), size: 18),
            ),
        ],
      ),
    );
  }
}