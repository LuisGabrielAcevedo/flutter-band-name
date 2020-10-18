import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Pages
import 'package:band_name/src/pages/home_page.dart';
import 'package:band_name/src/pages/status_page.dart';
// Services
import 'package:band_name/src/services/socket_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'status': (_) => StatusPage()},
      ),
    );
  }
}
