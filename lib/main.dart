import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/ui/screen_home.dart';
import 'package:productkintore/ui/screen_moyamoya_comment.dart';
import 'package:productkintore/ui/screen_moyamoya_create.dart';
import 'package:productkintore/ui/screen_moyamoya_detail.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'プロダクト筋トレ',
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomeScreen(),
        '/createMoyamoya': (BuildContext context) => MoyamoyaCreateScreen(),
        '/comment': (BuildContext context) => MoyamoyaCommentScreen(),
      },
      onGenerateRoute: (setting) {
        if (setting.name != null) {
          final settingsUri = Uri.parse(setting.name!);
          final ts = settingsUri.queryParameters['ts'];
          return MaterialPageRoute(
            builder: (_) => MoyamoyaDetailScreen(ts: ts),
          );
        }
      },
    );
  }
}
