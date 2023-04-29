import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';
import 'package:productkintore/provider/result.dart';
import 'package:productkintore/ui/screen_home.dart';

class MoyamoyaCommentScreen extends HookConsumerWidget
    with WidgetsBindingObserver {
  String? moyamoyaId;

  String _comment = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moyamoya = ModalRoute.of(context)!.settings.arguments;
    if (moyamoya == null || moyamoya is! Moyamoya) {
      return HomeScreen();
    }

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(providerConfigs: [
              EmailProviderConfiguration(),
            ]);
          }
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: EdgeInsets.all(24),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    moyamoya.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(moyamoya.moyamoya),
                  SizedBox(
                    height: 24,
                  ),
                  Text("コメント"),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'コメントをかきましょう！'),
                    onChanged: (value) {
                      _comment = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(moyamoyaProvider)
                            .commentMoyamoya(
                              ts: moyamoya.ts,
                              comment: _comment,
                            )
                            .whenComplete(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text("投稿する"))
                ]),
              ),
            ),
          );
        });
  }
}
