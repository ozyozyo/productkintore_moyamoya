import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';

class MoyamoyaCreateScreen extends HookConsumerWidget
    with WidgetsBindingObserver {
  String _title = "";

  String _comment = "";

  String _nickname = "モヤモヤさん";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(providerConfigs: [
              EmailProviderConfiguration(),
            ]);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("モヤモヤ投稿"),
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ニックネーム"),
                  TextField(
                    controller: TextEditingController(text: "モヤモヤさん"),
                    decoration: InputDecoration(hintText: 'ニックネームを入力してください'),
                    onChanged: (value) {
                      _nickname = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("タイトル"),
                  TextField(
                    decoration: InputDecoration(hintText: 'タイトルを入力してください'),
                    onChanged: (value) {
                      _title = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("モヤモヤの内容"),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '何にモヤモヤされていますか！'),
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
                            .createMoyamoya(
                                nickname: _nickname,
                                title: _title,
                                moyamoya: _comment)
                            .whenComplete(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text("投稿する"))
                ],
              ),
            ),
          );
        });
  }
}
