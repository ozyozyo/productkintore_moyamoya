import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';
import 'package:productkintore/provider/result.dart';
import 'package:productkintore/ui/screen_home.dart';

class MoyamoyaDetailScreen extends HookConsumerWidget
    with WidgetsBindingObserver {
  String? moyamoyaId;
  MoyamoyaDetailScreen({this.moyamoyaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moyamoya = ModalRoute.of(context)!.settings.arguments;
    if (moyamoyaId != null && moyamoya is Moyamoya) {
      moyamoyaId = moyamoya.moyamoyaId;
    }
    if (moyamoyaId == null) {
      return HomeScreen();
    }

    var provider = ref.watch(fetchMoyamoyaProvider(moyamoyaId!));
    return provider.when(data: (value) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(24),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 24,
              ),
              Text(
                value.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 24,
              ),
              Text(value.moyamoya),
              ElevatedButton(onPressed: () {}, child: Text("コメントする")),
            ]),
          ),
        ),
      );
    }, error: (e, s) {
      return Placeholder();
    }, loading: () {
      return Placeholder();
    });
  }
}
