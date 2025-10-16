import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/server_provider.dart';
import '../widgets/tab_bar_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'all_tab.dart';
import 'my_tab.dart';
import 'favorites_tab.dart';
import 'empty_state.dart';
import 'dart:math' as math;

class AccessPointScreen extends StatelessWidget {
  const AccessPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ServerProvider>(context);

    final bgColor = Color(0xFF1A2838);
    final screenW = MediaQuery.of(context).size.width;
    final contentWidth = math.min(343.0, screenW - 32.0); //поменяла, чтобы больше соответсвовало макету и сохранялась адаптивность

    Widget bodyForTab() {
      final filtered = prov.filteredForTab(prov.activeTab);
      if (filtered.isEmpty) {
        return EmptyState(
            title: 'Нет результатов',
            message:
            'По вашему запросу серверов\nне найдено. Попробуйте изменить\nзапрос или проверьте написание.');
      }

      switch (prov.activeTab) {
        case TabType.all:
          return Expanded(child: AllTab(contentWidth: contentWidth));
        case TabType.my:
          return Expanded(child: MyTab(contentWidth: contentWidth));
        case TabType.favorites:
          return Expanded(child: FavoritesTab(contentWidth: contentWidth));
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: (screenW - contentWidth) / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Точки доступа',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Center(
                child: CustomTabBar(width: contentWidth, height: 40),
              ),
              SizedBox(height: 16),
              Center(child: SearchBarWidget(width: contentWidth)),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    if (prov.filteredForTab(prov.activeTab).isEmpty)
                      EmptyState(
                        title: 'Нет результатов',
                        message:
                        'По вашему запросу серверов\nне найдено. Попробуйте изменить\nзапрос или проверьте написание.',
                      )
                    else
                      Flexible(child: _tabContentWidget(prov.activeTab, contentWidth)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabContentWidget(TabType tab, double contentWidth) {
    switch (tab) {
      case TabType.all:
        return AllTab(contentWidth: contentWidth);
      case TabType.my:
        return MyTab(contentWidth: contentWidth);
      case TabType.favorites:
        return FavoritesTab(contentWidth: contentWidth);
    }
  }
}

