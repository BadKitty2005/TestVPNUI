import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/server_provider.dart';

class CustomTabBar extends StatelessWidget {
  final double width;
  final double height;

  const CustomTabBar({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);
    final active = prov.activeTab;

    double tabWidth = (width - 20) / 3;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFF2B3E58),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTab(context, 'Все', TabType.all, active == TabType.all, tabWidth),
          _buildTab(context, 'Мои', TabType.my, active == TabType.my, tabWidth),
          _buildTab(context, 'Избранные', TabType.favorites, active == TabType.favorites, tabWidth),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String text, TabType tab, bool isActive, double width) {
    return GestureDetector(
      onTap: () {
        Provider.of<ServerProvider>(context, listen: false).setActiveTab(tab);
      },
      child: Container(
        width: width,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF1D58E5) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}