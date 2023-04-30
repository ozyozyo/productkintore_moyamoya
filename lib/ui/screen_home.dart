import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/ui/screen_moyamoya.dart';

enum Menu { moyamoya }

extension MenuExtension on Menu {
  static final names = {
    Menu.moyamoya: "モヤモヤ",
  };
  static final widget = {
    Menu.moyamoya: MoyamoyaScreen(),
  };
  String get typeName => names[this]!;
  Widget get typeWidget => widget[this]!;
}

class HomeScreen extends HookConsumerWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var menu = useState(Menu.moyamoya);
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active)
            return Placeholder();

          return Scaffold(
            appBar: AppBar(),
            body: menu.value.typeWidget,
            // ここからサイドメニュー部分
            drawer: Drawer(
              child: ListView(
                children: composeMenu(menu).toList(),
              ),
            ),
          );
        });
  }

  List<Widget> composeMenu(ValueNotifier<Menu> menu) {
    List<ListTile> result = [];
    for (var m in Menu.values) {
      result.add(
        ListTile(
          title: Text(m.typeName),
          onTap: () {
            menu.value = m;
          },
        ),
      );
    }
    return result;
  }
}
