import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/server_provider.dart';
import 'screens/access_point_screen.dart';

void main() {
  runApp(const AccessPointsApp());
}

class AccessPointsApp extends StatelessWidget {
  const AccessPointsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Access Points',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF1A2838),
          fontFamily: 'Inter',
        ),
        home: const AccessPointScreen(),
      ),
    );
  }
}

