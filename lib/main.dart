import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'provider/server_provider.dart';
import 'screens/access_point_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const AccessPointsApp(),
    ),
  );
}

class AccessPointsApp extends StatelessWidget {
  const AccessPointsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF1A2838);
//иконочки системные теперь белые
    return ChangeNotifierProvider(
      create: (_) => ServerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Access Points',
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: 'Inter',
        ),
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: backgroundColor,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: AccessPointScreen(),
        ),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}



