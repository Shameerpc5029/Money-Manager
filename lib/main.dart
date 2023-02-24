import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/common/style/theme.dart';

import 'package:money_manager/screens/home/controller/home.dart';
import 'package:money_manager/screens/home/model/hive_model.dart';
import 'package:money_manager/screens/home/view/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HiveModelAdapter().typeId)) {
    Hive.registerAdapter(HiveModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(context),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
