import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/moyamoya_provider.dart';
import 'package:productkintore/provider/result.dart';

class MoyamoyaScreen extends HookConsumerWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moyamoyaList = useState(<Moyamoya>[]);
    var provider = ref.watch(fetchAllMoyamoyaProvider);
    provider.when(
        data: (data) {
          moyamoyaList.value.addAll(data);
        },
        error: (e, s) {},
        loading: () {});

    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(height: 0.5);
      },
      itemCount: moyamoyaList.value.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(moyamoyaList.value[index].title),
          subtitle:
              Text(moyamoyaList.value[index].moyamoya.substring(0, 40) + "..."),
          onTap: () {
            Navigator.pushNamed(
                context,
                "/moyamoyaDetail?moyamoyaId=" +
                    moyamoyaList.value[index].moyamoyaId,
                arguments: moyamoyaList.value[index]);
          },
        );
      },
    );
  }
}
